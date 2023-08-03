//
//  ScheduleUseCase.swift
//  Domain
//
//  Created by Jaewon Yun on 2023/08/07.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Foundation
import RxSwift

public protocol ScheduleUseCaseProtocol {
    
    func save(schedule: Schedule) -> Single<Void>
    
    func getAll() -> Single<[Schedule]>
    
    func delete(byObjectID objectID: UUID) -> Single<Void>
    
}

public final class ScheduleUseCase: ScheduleUseCaseProtocol {
    
    let scheduleRepository: ScheduleRepository
    
    public init(scheduleRepository: ScheduleRepository) {
        self.scheduleRepository = scheduleRepository
    }
    
    public func save(schedule: Schedule) -> Single<Void> {
        return scheduleRepository.save(schedule: schedule)
    }
    
    public func getAll() -> Single<[Schedule]> {
        return scheduleRepository.getAll()
    }
    
    public func delete(byObjectID objectID: UUID) -> Single<Void> {
        return scheduleRepository.delete(byObjectID: objectID)
    }
    
}
