import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Configurations

let frameworkName = TargetName.iOSCore
var defaultDependencies: [TargetDependency] = [
    .project(target: TargetName.domain,
             path: .relativeToRoot("\(APPLICATION_NAME)/\(TargetName.domain)")),
    .project(target: TargetName.utility,
             path: .relativeToRoot("\(APPLICATION_NAME)/\(TargetName.utility)")),
    .project(target: TargetName.realmPlatform,
             path: .relativeToRoot("\(APPLICATION_NAME)/\(TargetName.realmPlatform)")),
    .external(name: ExternalDependencyName.rxSwift),
    .external(name: ExternalDependencyName.rxCocoa),
    .external(name: ExternalDependencyName.snapKit),
    .external(name: ExternalDependencyName.swinject),
    .external(name: ExternalDependencyName.rxUtility),
]
let testTargetDependencies: [TargetDependency] = [
    .target(name: frameworkName),
    .external(name: ExternalDependencyName.rxTest),
]

// MARK: - Targets

let frameworkTarget: Target = .makeFrameworkTarget(
    name: frameworkName,
    bundleId: "\(BASIC_BUNDLE_ID).\(frameworkName)",
    deploymentTarget: SHARED_DEPLOYMENT_TARGET,
    dependencies: defaultDependencies
)

let frameworkUnitTestsTargetName = "\(frameworkName)UnitTests"
let frameworkUnitTestsTarget: Target = .makeUnitTestsTarget(
    name: frameworkUnitTestsTargetName,
    bundleId: "\(BASIC_BUNDLE_ID).\(frameworkUnitTestsTargetName)",
    deploymentTarget: SHARED_DEPLOYMENT_TARGET,
    dependencies: testTargetDependencies
)

// MARK: - Project

let project: Project = .makeProject(
    name: frameworkName,
    targets: [frameworkTarget, frameworkUnitTestsTarget],
    schemes: [
        .makeFrameworkScheme(
            name: frameworkName,
            testAction: .targets(
                ["\(frameworkUnitTestsTargetName)"],
                options: .options(
                    coverage: true,
                    codeCoverageTargets: ["\(frameworkName)"]
                )
            )
        ),
        .hideScheme(name: frameworkUnitTestsTargetName),
    ]
)
