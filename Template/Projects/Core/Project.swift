import ProjectDescription
import ProjectDescriptionHelpers

let name = "Core"

let project = Project.feature(
    name: name,
    packages: [],
    targets: [        
        .makeAdditionalTarget(name: "Utility", bundleId: "com.Core.Utility", dependencies: [
            .target(name: "Extensions")
        ]),
        .makeAdditionalTarget(name: "Extensions", bundleId: "com.Core.Extensions", dependencies: [
            
        ]),
    ]
)

