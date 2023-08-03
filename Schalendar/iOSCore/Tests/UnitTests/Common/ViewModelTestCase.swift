//
//  ViewModelTestCase.swift
//  iOSCoreUnitTests
//
//  Created by Jaewon Yun on 2023/08/17.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import iOSCore
import XCTest

class ViewModelTestCase<ViewModel: RxViewModel>: RxBaseTestCase {
    
    /// 테스트 대상인 뷰모델입니다.
    ///
    /// 하나의 테스트 케이스가 종료되면 `tearDown` 단계에서 nil 로 초기화됩니다.
    var sut: ViewModel!
    
    /// <#Description#>
    ///
    /// 하나의 테스트 케이스가 종료되면 `tearDown` 단계에서 nil 로 초기화됩니다.
    var input: ViewModel.Input!
    
    /// <#Description#>
    ///
    /// 하나의 테스트 케이스가 종료되면 `tearDown` 단계에서 nil 로 초기화됩니다.
    var output: ViewModel.Output!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        input = nil
        output = nil
    }
    
}
