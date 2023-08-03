//
//  Coordinator.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/05/03.
//

import Foundation

public protocol Coordinator: AnyObject {
    
    /// 하위 flow 가 있을 경우 해당 하위 `Coordinator` 의 참조를 유지하는 배열
    var childCoordinators: [Coordinator] { get set }
    
    /// `Coordinator` 가 담당하는 flow 의 시작을 담당하는 함수.
    func start()
    
}
