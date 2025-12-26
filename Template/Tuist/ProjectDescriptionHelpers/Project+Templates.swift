import ProjectDescription

public extension Project {

    // ----------------------------------------
    // MARK: - App Project Template
    // ----------------------------------------
    static func app(
        name: String,
        packages: [Package],
        targets: [Target]
    ) -> Project {
        return Project(
            name: name,
            packages: packages,
            targets: targets
        )
    }

    // ----------------------------------------
    // MARK: - Feature Project Template
    // ----------------------------------------
    static func feature(
        name: String,
        packages: [Package] = [],
        targets: [Target],
    
    ) -> Project {
        return Project(
            name: name,
            packages: packages,
            targets: targets
        )
    }
}
