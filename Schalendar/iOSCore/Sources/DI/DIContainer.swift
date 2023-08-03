//
//  DIContainer.swift
//  Schalendar
//
//  Created by Jaewon Yun on 2023/08/04.
//  Copyright © 2023 woin2ee. All rights reserved.
//

import Domain
import RealmPlatform
import RealmSwift
import Swinject
import UIKit

public final class DIContainer {
    
    public static let shared: DIContainer = .init()
    
    let container: Container = .init()
    
    init() {
        registerRepositories()
        registerUseCases()
        registerMainScene()
        registerAddScheduleScene()
    }
    
    func registerMainScene() {
        container.register(ScheduleListViewModel.self) { r in
            let scheduleUseCase = r.resolve(ScheduleUseCaseProtocol.self)!
            return ScheduleListViewModel.init(scheduleUseCase: scheduleUseCase)
        }
        container.register(ScheduleListViewController.self) { r in
            let viewModel = r.resolve(ScheduleListViewModel.self)!
            return ScheduleListViewController.init(viewModel: viewModel)
        }
    }
    
    func registerAddScheduleScene() {
        container.register(AddScheduleViewModel.self) { r in
            let scheduleUseCase = r.resolve(ScheduleUseCaseProtocol.self)!
            return AddScheduleViewModel.init(scheduleUseCase: scheduleUseCase)
        }
        container.register(AddScheduleViewController.self) { r in
            let viewModel = r.resolve(AddScheduleViewModel.self)!
            return AddScheduleViewController.init(viewModel: viewModel)
        }
    }
    
    func registerRepositories() {
        container.register(Domain.ScheduleRepository.self) { _ in
            var config: Realm.Configuration = .defaultConfiguration
            config.schemaVersion = 1
            let realm: Realm = try! .init(configuration: config) // FIXME: Realm 파일 url 관리
            #if DEBUG
                print("Realm file url : \(realm.configuration.fileURL)")
                print("Realm encryption key : \(realm.configuration.encryptionKey)")
            #endif
            return RealmPlatform.ScheduleRepository.init(realm: realm)
        }
        .inObjectScope(.container)
    }
    
    func registerUseCases() {
        container.register(ScheduleUseCaseProtocol.self) { r in
            let repository = r.resolve(Domain.ScheduleRepository.self)!
            return ScheduleUseCase.init(scheduleRepository: repository)
        }
        .inObjectScope(.container)
    }
    
    public func resolve<T>() -> T {
        return container.resolve(T.self)!
    }
    
}
