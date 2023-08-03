//
//  ScheduleListViewModel.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa
import Utility

public final class ScheduleListViewModel: RxViewModel {
    
    public let scheduleListUpdateSignal: PublishRelay<Void> = .init()
    
    let scheduleUseCase: ScheduleUseCaseProtocol
    
    init(scheduleUseCase: ScheduleUseCaseProtocol) {
        self.scheduleUseCase = scheduleUseCase
    }
    
    public func transform(input: Input) -> Output {
        let schedules = scheduleListUpdateSignal
            .startWith(())
            .flatMapLatest {
                return self.scheduleUseCase.getAll()
            }
            .asDriverOnErrorJustComplete()
        return .init(
            addButtonTapSignal: input.addButtonTapSignal,
            schedules: schedules
        )
    }
    
}

// MARK: - Input & Output

extension ScheduleListViewModel {
    
    public struct Input {
        
        let addButtonTapSignal: Signal<Void>
        
    }
    
    public struct Output {
        
        let addButtonTapSignal: Signal<Void>
        let schedules: Driver<[Domain.Schedule]>
        
    }
    
}
