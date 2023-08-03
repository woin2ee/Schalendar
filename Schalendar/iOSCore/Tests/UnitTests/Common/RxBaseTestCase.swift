//
//  RxBaseTestCase.swift
//  ItsMETests
//
//  Created by Jaewon Yun on 2023/05/17.
//

import RxSwift
import RxTest
import XCTest

class RxBaseTestCase: BaseTestCase {
    
    /// <#Description#>
    ///
    /// 하나의 테스트 케이스가 종료되면 `tearDown` 단계에서 nil 로 초기화됩니다.
    var disposeBag: DisposeBag!
    
    /// 테스트에 사용되는 스케쥴러입니다.
    ///
    /// 하나의 테스트 케이스가 종료되면 `tearDown` 단계에서 nil 로 초기화됩니다.
    var testScheduler: TestScheduler!
    
    /// 관찰한 이벤트가 기록되는 테스트용 옵저버입니다.
    ///
    /// 하나의 테스트 케이스가 종료되면 `tearDown` 단계에서 nil 로 초기화됩니다.
    var testableObserver: TestableObserver<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        disposeBag = .init()
        testScheduler = .init(initialClock: 0)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        disposeBag = nil
        testScheduler = nil
        testableObserver = nil
    }
}
