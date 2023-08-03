//
//  Schedule.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Foundation
import RealmSwift

final class Schedule: Object {
    
    @Persisted(primaryKey: true) var objectID: UUID
    @Persisted var title: String
    @Persisted var date: Date
    @Persisted var isCompleted: Bool
    
    convenience init(objectID: UUID, title: String, date: Date, isCompleted: Bool) {
        self.init()
        self.objectID = objectID
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
    
}
