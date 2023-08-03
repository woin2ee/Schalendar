//
//  SharedConfig.swift
//  ProjectDescriptionHelpers
//
//  Created by Jaewon Yun on 2023/05/19.
//

import ProjectDescription

// MARK: - Common Settings

public let BASIC_BUNDLE_ID = "com.woin2ee"

public let ORGANIZATION = "woin2ee"

public let APPLICATION_NAME = "Schalendar"

public let SHARED_DEPLOYMENT_TARGET: DeploymentTarget = .iOS(targetVersion: "16.0", devices: [.iphone, .ipad])

public let XCODE_VERSION: Version? = .init(14, 3, 1)

// MARK: - Naming

public struct TargetName {
    public static let iPhoneApp = "\(APPLICATION_NAME)_iPhone"
    public static let iPadApp = "\(APPLICATION_NAME)_iPad"
    public static let domain = "Domain"
    public static let utility = "Utility"
    public static let realmPlatform = "RealmPlatform"
    public static let iOSCore = "iOSCore"
}

public struct ExternalDependencyName {
    public static let rxSwift = "RxSwift"
    public static let rxCocoa = "RxCocoa"
    public static let rxTest = "RxTest"
    public static let rxBlocking = "RxBlocking"
    public static let alamofire = "Alamofire"
    public static let rxAlamofire = "RxAlamofire"
    public static let swinject = "Swinject"
    public static let snapKit = "SnapKit"
    public static let realm = "Realm"
    public static let realmSwift = "RealmSwift"
    public static let rxUtility = "RxUtility"
}
