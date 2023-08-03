//
//  AddScheduleCoordinator.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/05.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import iOSCore
import UIKit

protocol AddScheduleCoordinatorDelegate: AnyObject {
    
    func didComplete(addSchedule: AddScheduleCoordinator)
    
    func didCancel(addSchedule: AddScheduleCoordinator)
    
}

final class AddScheduleCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    weak var delegate: AddScheduleCoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController: AddScheduleViewController = DIContainer.shared.resolve()
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
}

extension AddScheduleCoordinator: AddScheduleViewControllerDelegate {
    
    func didTapCompleteButton() {
        delegate?.didComplete(addSchedule: self)
    }
    
    func didTapCancelButton() {
        delegate?.didCancel(addSchedule: self)
    }
    
}
