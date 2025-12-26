// example.swift
import ProjectDescription

let projectName: Template.Attribute = .required("name")

let template = Template(
    description: "A template for new module",
    attributes: [
        projectName
    ],
    items: [
        .directory(
            path: "Projects/\(projectName)",
            sourcePath: "Sources"
        ),
        .file(
            path: "Projects/\(projectName)/Project.swift",
            templatePath: "project.stencil"
        )
    ]
)



