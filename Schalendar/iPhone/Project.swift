import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Configurations

let appName = "\(APPLICATION_NAME)"
let appBundleConfigurationInfoPlist: [String: InfoPlist.Value] = [
    "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
    "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)",
    "CFBundleShortVersionString": "$(MARKETING_VERSION)",
    "CFBundleDevelopmentRegion": "ko_KR",
]
let appUserInterfaceInfoPlist: [String: InfoPlist.Value] = [
    "UILaunchStoryboardName": "LaunchScreen",
]
let appExecutionInfoPlist: [String: InfoPlist.Value] = [
    "CFBundleExecutable": "$(EXECUTABLE_NAME)",
]
let dataAndStorageInfoPlist: [String: InfoPlist.Value] = [:]
let appInfoPlist: [String: InfoPlist.Value] = appBundleConfigurationInfoPlist
    .merging(appUserInterfaceInfoPlist) { $1 }
    .merging(appExecutionInfoPlist) { $1 }
    .merging(dataAndStorageInfoPlist) { $1 }
let baseBuildSettings: SettingsDictionary = [
    "MARKETING_VERSION": "0.1.0",
    "CURRENT_PROJECT_VERSION": "1",
]
let dependencies: [TargetDependency] = [
    .project(target: TargetName.iOSCore,
             path: .relativeToRoot("\(APPLICATION_NAME)/\(TargetName.iOSCore)")),
]

// MARK: - Targets

let appTargetName = appName
let appTarget: Target = .makeAppTarget(
    name: appTargetName,
    bundleId: "\(BASIC_BUNDLE_ID).\(appName)",
    deploymentTarget: SHARED_DEPLOYMENT_TARGET,
    infoPlist: .dictionary(appInfoPlist),
    entitlements: nil,
    dependencies: dependencies,
    settings: .settings(base: baseBuildSettings)
)

let appUITestsTargetName = "\(appTargetName)UITests"
let appUITestsTarget: Target = .makeUITestsTarget(
    name: appUITestsTargetName,
    bundleId: "\(BASIC_BUNDLE_ID).\(appUITestsTargetName)",
    deploymentTarget: SHARED_DEPLOYMENT_TARGET,
    dependencies: [.target(name: appTargetName)]
)

// MARK: - Project

let appProject: Project = .makeProject(
    name: "iPhone",
    targets: [appTarget, appUITestsTarget],
    schemes: [
        .makeAppScheme(testAction: .targets(["\(appUITestsTargetName)"])),
        .hideScheme(name: appUITestsTargetName),
    ]
)
