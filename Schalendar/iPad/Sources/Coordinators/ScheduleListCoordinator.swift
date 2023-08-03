//
//  ScheduleListCoordinator.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/17.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import iOSCore
import UIKit

final class ScheduleListCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    weak var scheduleListViewController: ScheduleListViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController: ScheduleListViewController = DIContainer.shared.resolve()
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: false)
        self.scheduleListViewController = viewController
    }
    
}

// MARK: - ScheduleListViewControllerDelegate

extension ScheduleListCoordinator: ScheduleListViewControllerDelegate {
    
    func didTapAddScheduleButton() {
        let presentedNavigationController: UINavigationController = .init()
        let coordinator: AddScheduleCoordinator = .init(navigationController: presentedNavigationController)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
        navigationController.present(presentedNavigationController, animated: true)
    }
    
}

// MARK: - Child Coordinators Delegate

extension ScheduleListCoordinator: AddScheduleCoordinatorDelegate {
    
    func didComplete(addSchedule: AddScheduleCoordinator) {
        navigationController.dismiss(animated: true)
        childCoordinators.removeAll { $0 === addSchedule }
        scheduleListViewController?.viewModel.scheduleListUpdateSignal.accept(())
    }
    
    func didCancel(addSchedule: AddScheduleCoordinator) {
        navigationController.dismiss(animated: true)
        childCoordinators.removeAll { $0 === addSchedule }
    }
    
}
