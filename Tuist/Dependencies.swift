import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [
    ],
    swiftPackageManager: [
        // RxSwift
        .remote(url: "https://github.com/ReactiveX/RxSwift.git",
                requirement: .upToNextMajor(from: "6.6.0")),
        // Alamofire
        .remote(url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .upToNextMajor(from: "5.6.4")),
        // RxAlamofire
        .remote(url: "https://github.com/RxSwiftCommunity/RxAlamofire.git",
                requirement: .upToNextMajor(from: "6.1.0")),
        // Swinject
        .remote(url: "https://github.com/Swinject/Swinject.git",
                requirement: .upToNextMajor(from: "2.8.0")),
        // SnapKit
        .remote(url: "https://github.com/SnapKit/SnapKit.git",
                requirement: .upToNextMajor(from: "5.0.1")),
        // Realm
        .remote(url: "https://github.com/realm/realm-swift.git",
                requirement: .upToNextMajor(from: "10.42.0")),
        // RxUtility
        .remote(url: "https://github.com/woin2ee/RxUtility.git",
                requirement: .upToNextMajor(from: "1.0.0")),
    ],
    platforms: [SHARED_DEPLOYMENT_TARGET.platform]
)
