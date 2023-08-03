import ProjectDescription
import ProjectDescriptionHelpers

let frameworkName = TargetName.utility
let dependencies: [TargetDependency] = [
    .external(name: ExternalDependencyName.rxSwift),
    .external(name: ExternalDependencyName.rxCocoa),
]

// MARK: - Targets

let frameworkTarget: Target = .makeFrameworkTarget(
    name: frameworkName,
    bundleId: "\(BASIC_BUNDLE_ID).\(frameworkName)",
    deploymentTarget: SHARED_DEPLOYMENT_TARGET,
    dependencies: dependencies
)

// MARK: - Project

let project: Project = .makeProject(
    name: frameworkName,
    targets: [frameworkTarget],
    schemes: [.hideScheme(name: frameworkName)]
)
