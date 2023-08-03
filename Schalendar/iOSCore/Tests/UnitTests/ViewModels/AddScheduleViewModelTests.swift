//
//  AddScheduleViewModelTests.swift
//  Core
//
//  Created by Jaewon Yun on 2023/08/17.
//  Copyright © 2023 woin2ee. All rights reserved.
//

@testable import iOSCore
import RxSwift
import RxCocoa
import RxTest
import Utility
import XCTest

final class AddScheduleViewModelTests: ViewModelTestCase<AddScheduleViewModel> {
    
    var scheduleUseCaseSpy: ScheduleUseCaseSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        scheduleUseCaseSpy = .init()
        sut = .init(scheduleUseCase: scheduleUseCaseSpy)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        scheduleUseCaseSpy = nil
    }
    
    func testCompleteSignal() {
        arrange {
            input = makeInput(completeSignal: testScheduler.createTrigger().asSignalOnErrorJustComplete())
            output = sut.transform(input: input)
        }
        act {
            testableObserver = testScheduler.start {
                return self.output.completeSignal.mapToAny()
            }
        }
        assert {
            XCTAssertEqual(testableObserver.events.count, 1)
            XCTAssertEqual(scheduleUseCaseSpy.didCallSave, 1)
        }
    }
    
    func testCancelSignal() {
        arrange {
            input = makeInput(cancelSignal: testScheduler.createTrigger().asSignalOnErrorJustComplete())
            output = sut.transform(input: input)
        }
        act {
            testableObserver = testScheduler.start {
                return self.output.cancelSignal.mapToAny()
            }
        }
        assert {
            XCTAssertEqual(testableObserver.events.count, 1)
            XCTAssertEqual(scheduleUseCaseSpy.didCallSave, 0)
        }
    }
    
    func testCompleteButtonEnabledStatus() {
        arrange {
            input = makeInput(title: .just(""))
            output = sut.transform(input: input)
        }
        act {
            testableObserver = testScheduler.start {
                return self.output.canComplete.mapToAny()
            }
        }
        assert {
            let onlyNextEvents = testableObserver.events
                .filter { !$0.value.isStopEvent }
                .map(\.value)
            XCTAssertFalse(onlyNextEvents.contains { $0.element as! Bool == true })
        }
    }
    
    func makeInput(
        title: Driver<String> = .just("Title"),
        date: Driver<Date> = .just(.now),
        completeSignal: Signal<Void> = .never(),
        cancelSignal: Signal<Void> = .never()
    ) -> AddScheduleViewModel.Input {
        return .init(
            title: title,
            date: date,
            completeSignal: completeSignal,
            cancelSignal: cancelSignal
        )
    }
    
}
