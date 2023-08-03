//
//  Target+makeUnitTest.swift
//  Config
//
//  Created by Jaewon Yun on 2023/05/19.
//

import ProjectDescription

extension Target {
    
    public static func makeUITestsTarget(
        name: String,
        productName: String? = nil,
        bundleId: String,
        deploymentTarget: DeploymentTarget,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = "Tests/UITests/**",
        resources: ResourceFileElements? = nil,
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Path? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency],
        settings: Settings? = .settings(),
        coreDataModels: [CoreDataModel] = [],
        environment: [String: String] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = []
    ) -> Target {
        let platform: Platform = deploymentTarget.platform
        let product: Product = .uiTests
        
        return .init(
            name: name,
            platform: platform,
            product: product,
            productName: productName,
            bundleId: bundleId,
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            copyFiles: copyFiles,
            headers: headers,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings,
            coreDataModels: coreDataModels,
            environment: environment,
            launchArguments: launchArguments,
            additionalFiles: additionalFiles
        )
    }
    
    public static func makeUnitTestsTarget(
        name: String,
        productName: String? = nil,
        bundleId: String,
        deploymentTarget: DeploymentTarget,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = "Tests/UnitTests/**",
        resources: ResourceFileElements? = nil,
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Path? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency],
        settings: Settings? = .settings(),
        coreDataModels: [CoreDataModel] = [],
        environment: [String: String] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = []
    ) -> Target {
        let platform: Platform = deploymentTarget.platform
        let product: Product = .unitTests
        
        return .init(
            name: name,
            platform: platform,
            product: product,
            productName: productName,
            bundleId: bundleId,
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            copyFiles: copyFiles,
            headers: headers,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings,
            coreDataModels: coreDataModels,
            environment: environment,
            launchArguments: launchArguments,
            additionalFiles: additionalFiles
        )
    }
    
    public static func makeAppTarget(
        name: String,
        productName: String? = nil,
        bundleId: String,
        deploymentTarget: DeploymentTarget,
        infoPlist: InfoPlist?,
        sources: SourceFilesList? = "Sources/**",
        resources: ResourceFileElements? = "Resources/**",
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Path?,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency],
        settings: Settings?,
        coreDataModels: [CoreDataModel] = [],
        environment: [String: String] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = []
    ) -> Target {
        let platform: Platform = deploymentTarget.platform
        let product: Product = .app
        
        return .init(
            name: name,
            platform: platform,
            product: product,
            productName: productName,
            bundleId: bundleId,
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            copyFiles: copyFiles,
            headers: headers,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings,
            coreDataModels: coreDataModels,
            environment: environment,
            launchArguments: launchArguments,
            additionalFiles: additionalFiles
        )
    }
    
    public static func makeFrameworkTarget(
        name: String,
        productName: String? = nil,
        bundleId: String,
        deploymentTarget: DeploymentTarget,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = "Sources/**",
        resources: ResourceFileElements? = nil,
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Path? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency],
        settings: Settings? = .settings(),
        coreDataModels: [CoreDataModel] = [],
        environment: [String: String] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = []
    ) -> Target {
        let platform: Platform = deploymentTarget.platform
        let product: Product = .framework
        
        return .init(
            name: name,
            platform: platform,
            product: product,
            productName: productName,
            bundleId: bundleId,
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            copyFiles: copyFiles,
            headers: headers,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings,
            coreDataModels: coreDataModels,
            environment: environment,
            launchArguments: launchArguments,
            additionalFiles: additionalFiles
        )
    }
}
