import ProjectDescription
import ProjectDescriptionHelpers


let name = "Login"

let project = Project.feature(
    name: name,
    packages: [],
    targets: [
             Target.makeFeatureModuleTarget(name: name, dependencies: [
                .external(name: "Lottie", condition: .none)
             ]),
             Target.makeFeatureServiceTarget(name: name, dependencies: [])
    ]
)




