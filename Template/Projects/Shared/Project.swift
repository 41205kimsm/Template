import ProjectDescription
import ProjectDescriptionHelpers

let name = "Shared"

let project = Project.feature(
    name: name,
    packages: [],
    targets: [
        .makeAdditionalTarget(name: "DesignSystem", bundleId: "com.Shared.DesignSystem", hasResource: true, dependencies: []),
        .makeAdditionalTarget(name: "CommonUI", bundleId: "com.Shared.CommonUI", dependencies: [
            .external(name: "SnapKit", condition: .none)
        ])
    ]
)
