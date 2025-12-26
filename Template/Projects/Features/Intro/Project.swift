import ProjectDescription
import ProjectDescriptionHelpers


let name = "Intro"

let project = Project.feature(
    name: name,
    packages: [],
    targets: [
             Target.makeFeatureModuleTarget(name: name, dependencies: [
                .project(target: "LoginModule", path: "../Login")
             ]),
             Target.makeFeatureServiceTarget(name: name, dependencies: [])
    ]
)

