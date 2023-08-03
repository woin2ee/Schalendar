//
//  Schedule+Mapping.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Domain
import Foundation
import RealmSwift

extension Domain.Schedule {
    
    func toObjectModel() -> Schedule {
        return .init(objectID: self.objectID, title: self.title, date: self.date, isCompleted: self.isCompleted)
    }
    
}

extension Schedule {
    
    func toDomain() -> Domain.Schedule {
        return .init(objectID: self.objectID, title: self.title, date: self.date, isCompleted: self.isCompleted)
    }
    
}
