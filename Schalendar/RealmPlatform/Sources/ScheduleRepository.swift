//
//  ScheduleRepository.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Domain
import Foundation
import RealmSwift
import RxSwift

public final class ScheduleRepository: Domain.ScheduleRepository {
    
    let realm: Realm
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
    public func save(schedule: Domain.Schedule) -> RxSwift.Single<Void> {
        return .create { observer in
            try? self.realm.write {
                self.realm.add(schedule.toObjectModel()) // 수정까지?
                observer(.success(()))
            }
            observer(.failure(ScheduleRepositoryError.notSaved))
            return Disposables.create()
        }
    }
    
    public func getAll() -> RxSwift.Single<[Domain.Schedule]> {
        return .create { observer in
            let schedules = self.realm.objects(Schedule.self)
                .map { $0.toDomain() }
            observer(.success(schedules.map { $0 }))
            return Disposables.create()
        }
    }
    
    public func delete(byObjectID objectID: UUID) -> RxSwift.Single<Void> {
        return .create { observer in
            try? self.realm.write {
                if let schedule = self.realm.object(ofType: Schedule.self, forPrimaryKey: objectID) {
                    self.realm.delete(schedule)
                    observer(.success(()))
                }
            }
            observer(.failure(ScheduleRepositoryError.notDeleted))
            return Disposables.create()
        }
    }
    
}
