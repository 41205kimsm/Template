import ProjectDescription

public extension Target {
    static func makeTarget(
        name: String,
        product: Product,
        bundleId: String,
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = nil,
        hasResource: Bool,
        dependencies: [TargetDependency] = []) -> Target
    {
        return .target(
            name: name,
            destinations: .iOS,
            product: product,
            bundleId: bundleId,
            deploymentTargets: .iOS("15.0"),
            infoPlist: infoPlist,
            sources: sources,
            resources: hasResource ? ["Resources/**"] : [],
            dependencies: dependencies
        )
    }
    
    static func makeFeatureTargets(name: String) -> [Target] {
        let architecture: TargetDependency =
            .project(target: "Architecture",
                     path: "../../Architecture")
        
        return [
                .makeTarget(name: "\(name)Service",
                            product: .framework,
                            bundleId: "com.\(name).\(name)Service",
                            sources: ["Sources/\(name)Service/**"],
                            hasResource: false,
                            dependencies: [
                                architecture
                            ]),
                    
                .makeTarget(name: "\(name)Module",
                            product: .framework,
                            bundleId: "com.\(name).\(name)Module",
                            sources: ["Sources/\(name)Module/**"],
                            hasResource: false,
                            dependencies: [
                                architecture,
                                .target(name: "\(name)Service")
                            ])
        ]
    }
    
    static func makeFeatureServiceTarget(name: String,
                                         dependencies: [TargetDependency]) -> Target
    {
        let architecture: TargetDependency =
            .project(target: "Architecture",
                     path: "../../Architecture")
        let network: TargetDependency =
            .project(target: "Network",
                     path: "../../Network")
        
        var dependencies = dependencies
        dependencies.append(architecture)
        dependencies.append(network)
        
        return .makeTarget(name: "\(name)Service",
                           product: .framework,
                           bundleId: "com.\(name).\(name)Service",
                           sources: ["Sources/\(name)Service/**"],
                           hasResource: false,
                           dependencies: dependencies)
    }
    
    static func makeFeatureModuleTarget(name: String,                                         
                                        dependencies: [TargetDependency]) -> Target
    {
        let architecture: TargetDependency = .project(target: "Architecture", path: "../../Architecture")
        let utility: TargetDependency = .project(target: "Utility", path: "../../Core")
        let extensions: TargetDependency = .project(target: "Extensions", path: "../../Core")
        let designSystem: TargetDependency = .project(target: "DesignSystem", path: "../../Shared")
        let commonUI: TargetDependency = .project(target: "CommonUI", path: "../../Shared")
        
        let snapKit: TargetDependency = .external(name: "SnapKit", condition: .none)
        
        var dependencies = dependencies
        dependencies.append(architecture)
        dependencies.append(.target(name: "\(name)Service"))
        dependencies.append(snapKit)
        dependencies.append(utility)
        dependencies.append(extensions)
        dependencies.append(commonUI)
        dependencies.append(designSystem)
        
        return  .makeTarget(name: "\(name)Module",
                            product: .framework,
                            bundleId: "com.\(name).\(name)Module",
                            sources: ["Sources/\(name)Module/**"],
                            hasResource: false,
                            dependencies: dependencies)
    }
    
    static func makeBasicTarget(name: String) -> Target {
        return .makeTarget(name: "\(name)",
                            product: .framework,
                            bundleId: "com.\(name)",
                            sources: ["Sources/**"],
                            hasResource: false,
                            dependencies: [])
        
    }
    
    static func makeAdditionalTarget(name: String,
                                     bundleId: String,
                                     hasResource: Bool = false,
                                     dependencies: [TargetDependency]) -> Target {
        return .makeTarget(name: "\(name)",
                            product: .framework,
                            bundleId: bundleId,
                            sources: ["Sources/\(name)/**"],
                            hasResource: hasResource,
                            dependencies: dependencies)
        
    }
    
    static func makeAppTargets(name: String,
                               bundleId: String,
                               infoPlist: InfoPlist?,
                               dependencies: [TargetDependency] = []
    ) -> [Target] {

        return [
            .makeTarget(name: "\(name)",
                            product: .app,
                            bundleId: bundleId,
                            infoPlist: infoPlist,
                            sources: ["Sources/**"],
                            hasResource: true,
                            dependencies: dependencies)
        ]
    }
}

