//
//  AppCoordinator.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/15.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import iOSCore
import UIKit

/// 여러 상태에 따라 앱의 초기 `ViewController` 를 설정하는 `Coordinator` 입니다.
///
/// 앱의 전체적인 flow 는 이 `Coordinator` 의 `start()` 함수 호출로부터 시작됩니다.
///
/// 이 Coordinator 는 iPhone 에 종속적이게 정의되었습니다. iPad 는 큰 화면을 활용하여 ViewController 를 보여주는 방식이 달라질 수 있기 때문입니다.
/// 후에 iPhone / iPad 둘 다 지원할 경우 하나의 `ViewController` 를 공유하며 `Coordinator` 객체만 따로 작성하여 모듈로 분리가 가능합니다.
final class AppCoordinator: Coordinator {
    
    let rootNavigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    func start() {
        let scheduleListCoordinator: ScheduleListCoordinator = .init(navigationController: rootNavigationController)
        childCoordinators.append(scheduleListCoordinator)
        scheduleListCoordinator.start()
    }
    
}
