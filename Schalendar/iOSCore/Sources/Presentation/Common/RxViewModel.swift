//
//  RxViewModel.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Foundation

public protocol RxViewModel {
    
    associatedtype Input
    
    associatedtype Output
    
    func transform(input: Input) -> Output
    
}
