//
//  BaseTestCase.swift
//  iOSCoreUnitTests
//
//  Created by Jaewon Yun on 2023/08/17.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import XCTest

class BaseTestCase: XCTestCase {

    func arrange(_ block: (() -> Void)) {
        block()
    }
    
    func act(_ block: (() -> Void)) {
        block()
    }
    
    func assert(_ block: (() -> Void)) {
        block()
    }

}
