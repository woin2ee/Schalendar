//
//  AddScheduleViewModel.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Domain
import Foundation
import RxSwift
import RxCocoa
import RxUtility
import Utility

final class AddScheduleViewModel: RxViewModel {
    
    let scheduleUseCase: ScheduleUseCaseProtocol
    
    init(scheduleUseCase: ScheduleUseCaseProtocol) {
        self.scheduleUseCase = scheduleUseCase
    }
    
    func transform(input: Input) -> Output {
        let newObjectID: UUID = .init()
        let newSchedule = Driver.combineLatest(input.title, input.date) {
            return Schedule.init(objectID: newObjectID, title: $0, date: $1, isCompleted: false)
        }
        let completeSignal = input.completeSignal
            .withLatestFrom(newSchedule)
            .flatMapLatest { schedule in
                return self.scheduleUseCase.save(schedule: schedule)
                    .asSignalOnErrorJustComplete()
            }
        let canComplete = input.title
            .map(\.isNotEmpty)
        return .init(
            completeSignal: completeSignal,
            cancelSignal: input.cancelSignal,
            canComplete: canComplete
        )
    }
    
}

// MARK: - Input & Output

extension AddScheduleViewModel {
    
    struct Input {
        let title: Driver<String>
        let date: Driver<Date>
        let completeSignal: Signal<Void>
        let cancelSignal: Signal<Void>
    }
    
    public struct Output {
        let completeSignal: Signal<Void>
        let cancelSignal: Signal<Void>
        let canComplete: Driver<Bool>
    }
    
}
