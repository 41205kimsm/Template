// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [
            "Alamofire": .framework,
            "SnapKit": .framework,
            "Lottie": .framework
        ]
    )
#endif

let package = Package(
    name: "NKumonStudyV2",
    dependencies: [
         .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
         .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
         .package(url: "https://github.com/airbnb/lottie-ios.git", branch: "master")

    ]
)
