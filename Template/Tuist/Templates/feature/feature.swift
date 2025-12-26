// example.swift
import ProjectDescription

let name: Template.Attribute = .required("name")
let ui: Template.Attribute = .optional("ui", default: "uikit")

var uiFile: Template.Item {
    if "\(ui)" == "swiftui" {
        return .file(
            path: "Projects/Features/\(name)/Sources/Module/\(name)View.swift",
            templatePath: "view.stencil"
        )
    }
    return .file(
        path: "Projects/Features/\(name)/Sources/Module/\(name)ViewController.swift",
        templatePath: "viewController.stencil"
    )    
}

let featureTemplate = Template(
    description: "A template for new feature module",
    attributes: [
        name,
        ui
    ],
    items: [
        .file(
            path: "Projects/Features/\(name)/Project.swift",
            templatePath: "project.stencil"
        ),
        .directory(
            path: "Projects/Features/\(name)",
            sourcePath: "Sources"
        ),
        .directory(
            path: "Projects/Features/\(name)",
            sourcePath: "Resources"
        ),
        .directory(
            path: "Projects/Features/\(name)/Sources",
            sourcePath: "Module"
        ),
        .directory(
            path: "Projects/Features/\(name)/Sources",
            sourcePath: "Service"
        ),
        .file(
            path: "Projects/Features/\(name)/Sources/Module/\(name)ViewModel.swift",
            templatePath: "viewModel.stencil"
        ),
        uiFile,
        
        .file(
            path: "Projects/Features/\(name)/Sources/Module/\(name)Router.swift",
            templatePath: "router.stencil"
        ),
        .file(
            path: "Projects/Features/\(name)/Sources/Module/\(name)DependencyBox.swift",
            templatePath: "dependency.stencil"
        ),
        .file(
            path: "Projects/Features/\(name)/Sources/Module/\(name)Factory.swift",
            templatePath: "factory.stencil"
        ),
        .file(
            path: "Projects/Features/\(name)/Sources/Service/\(name)Service.swift",
            templatePath: "service.stencil"
        )
    ]
)
