//
//  ScheduleRepository.swift
//  Domain
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Foundation
import RxSwift

public protocol ScheduleRepository {
    
    func save(schedule: Schedule) -> Single<Void>
    
    func getAll() -> Single<[Schedule]>
    
    func delete(byObjectID objectID: UUID) -> Single<Void>
    
}
