//
//  SceneDelegate.swift
//  MyCounter
//
//  Created by Jaewon Yun on 2023/05/19.
//

import UIKit

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let rootNavigationController: UINavigationController = .init()
        window?.rootViewController = rootNavigationController
        
        let appCoordinator: AppCoordinator = .init(rootNavigationController: rootNavigationController)
        self.appCoordinator = appCoordinator
        appCoordinator.start()
    }
    
}
