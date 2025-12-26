import ProjectDescription

let project = Project(
    name: "Template",
    targets: [
        .target(
            name: "Template",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Template",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Template/Sources/**"],
            resources: ["Template/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "TemplateTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TemplateV2Tests",
            infoPlist: .default,
            sources: ["Template/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Template")]
        ),
    ]
)
