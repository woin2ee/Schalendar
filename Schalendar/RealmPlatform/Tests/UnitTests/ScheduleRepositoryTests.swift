//
//  ScheduleRepositoryTests.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

@testable import RealmPlatform
import RealmSwift
import RxBlocking
import XCTest

final class ScheduleRepositoryTests: XCTestCase {
    
    var sut: ScheduleRepository!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let realm: Realm = try .init(configuration: .init(inMemoryIdentifier: "RealmTest"))
        sut = .init(realm: realm)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testSaveAndGet() throws {
        // Arrange
        let schedule: Schedule = .init(objectID: .init(), title: "Test title", date: .now, isCompleted: false)
        
        // Act
        try sut.save(schedule: schedule.toDomain())
            .toBlocking()
            .single()
        
        // Assert
        let schedules = try sut.getAll()
            .toBlocking().single()
        XCTAssertEqual(schedules.count, 1)
        XCTAssertEqual(schedules.first!.title, "Test title")
    }
    
    func testGetWhenNoItem() throws {
        // Act
        let schedules = try sut.getAll()
            .toBlocking()
            .single()
        
        // Assert
        XCTAssertEqual(schedules.count, 0)
    }
    
    func testDelete() throws {
        // Arrange
        let schedule: Schedule = .init(objectID: .init(), title: "Test title", date: .now, isCompleted: false)
        try sut.save(schedule: schedule.toDomain())
            .toBlocking()
            .single()
        let schedulesBeforeDelete = try sut.getAll()
            .toBlocking()
            .single()
        let objectID = schedulesBeforeDelete.first!.objectID
        
        // Act
        try sut.delete(byObjectID: objectID)
            .toBlocking()
            .single()
        
        // Assert
        let schedulesAfterDelete = try sut.getAll()
            .toBlocking()
            .single()
        XCTAssertEqual(schedulesBeforeDelete.count, 1)
        XCTAssertEqual(schedulesAfterDelete.count, 0)
    }
    
}
