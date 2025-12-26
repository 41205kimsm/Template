import ProjectDescription
import ProjectDescriptionHelpers

let name = "Architecture"

let project = Project.feature(
    name: name,
    packages: [],
    targets: [
        Target.makeAdditionalTarget(name: name, bundleId: "com.\(name).\(name)", dependencies: [])
    ]
)
