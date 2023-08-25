import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Configurations

let frameworkName = TargetName.realmPlatform
let defaultDependencies: [TargetDependency] = [
    .project(target: TargetName.domain,
             path: .relativeToRoot("\(APPLICATION_NAME)/\(TargetName.domain)")),
    .package(product: ExternalDependencyName.realm),
    .package(product: ExternalDependencyName.realmSwift),
    .external(name: ExternalDependencyName.rxSwift),
]
let testTargetDependencies: [TargetDependency] = [
    .target(name: frameworkName),
    .external(name: ExternalDependencyName.rxBlocking),
]
let packages: [Package] = [
    .remote(url: "https://github.com/realm/realm-swift.git", requirement: .upToNextMajor(from: "10.42.0")),
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
    packages: packages,
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
