import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    name: "Template",
    packages: [
        
    ],
    targets:
        Target.makeAppTargets(name: "Template",
                             bundleId: "com.kumon.apps.ict.student.n",
                             infoPlist:.extendingDefault(with: [
                                "UILaunchStoryboardName": "LaunchScreen",

                                "UIApplicationSceneManifest": [
                                    "UIApplicationSupportsMultipleScenes": false,
                                    "UISceneConfigurations": [
                                        "UIWindowSceneSessionRoleApplication": [
                                            [
                                                "UISceneConfigurationName": "Default Configuration",
                                                "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate",
                                                "UIViewControllerBasedStatusBarAppearance": false,
                                                "UIStatusBarHidden": true
                                            ]
                                        ]
                                    ]
                                ]
                            ]),
                             dependencies: [
                                .project(target: "IntroModule", path: "../Features/Intro"),
                                .project(target: "IntroService", path: "../Features/Intro")
                                
                             ])
)
                            
