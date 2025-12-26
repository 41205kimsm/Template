import UIKit
import IntroModule
import Network
import DesignSystem

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootNavigationController: UINavigationController?
    // MARK: - UIScene Lifecycle

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        DesignSystemFont.registerFonts()
        
        window = UIWindow(windowScene: windowScene)

        let networkManager = NetworkManager(urlSession: .init(configuration: .default))
        let root = AppRootDependency(network: networkManager)
        let dependencies = IntroDependencies(dependency: root)
        let module = IntroModuleFactory(dependency: dependencies)
        let router = module.build()
        
        rootNavigationController = UINavigationController(rootViewController: router.viewController.uiViewController)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }

    // MARK: - Optional lifecycle hooks (필요 시 사용)

    func sceneDidDisconnect(_ scene: UIScene) {
        // Scene이 시스템에 의해 해제될 때
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Foreground 진입
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // 일시 중단 (전화, 알림 등)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Background → Foreground
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Foreground → Background
    }
}
