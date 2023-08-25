//
//  ScheduleRepositoryError.swift
//  RealmPlatform
//
//  Created by Jaewon Yun on 2023/08/07.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

enum ScheduleRepositoryError: Error {
    
    case notSaved
    case notDeleted
    case notMatchedObjectID(type: Object.Type, objectID: UUID)
    
}
