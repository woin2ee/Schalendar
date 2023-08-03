//
//  ScheduleUseCaseSpy.swift
//  iOSCore
//
//  Created by Jaewon Yun on 2023/08/17.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Domain
import Foundation
import RxSwift

final class ScheduleUseCaseSpy: ScheduleUseCaseProtocol {
    
    var didCallSave: Int = 0
    
    func save(schedule: Domain.Schedule) -> RxSwift.Single<Void> {
        didCallSave += 1
        return .just(())
    }
    
    func getAll() -> RxSwift.Single<[Domain.Schedule]> {
        let schedules: [Schedule] = [
            .init(objectID: .init(), title: "1", date: .now, isCompleted: false),
            .init(objectID: .init(), title: "2", date: .now, isCompleted: false),
            .init(objectID: .init(), title: "3", date: .now, isCompleted: false),
            .init(objectID: .init(), title: "4", date: .now, isCompleted: false),
        ]
        return .just(schedules)
    }
    
    func delete(byObjectID objectID: UUID) -> RxSwift.Single<Void> {
        
        return .just(())
    }
    
}
