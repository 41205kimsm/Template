import ProjectDescription
import ProjectDescriptionHelpers

let name = "Network"

let project = Project.feature(
    name: name,
    packages: [
        
    ],
    targets: [
        Target.makeAdditionalTarget(name: name,
                                    bundleId: "com.\(name).\(name)",
                                    dependencies:
                                        [
                                            .external(name: "Alamofire", condition: .none)
                                        ])
    ]
)
