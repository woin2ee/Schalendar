//
//  Schedule.swift
//  Domain
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Foundation

public struct Schedule {
    
    public let objectID: UUID
    
    public var title: String
    
    public var date: Date
    
    public var isCompleted: Bool
    
    public init(objectID: UUID, title: String, date: Date, isCompleted: Bool) {
        self.objectID = objectID
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
    
}
