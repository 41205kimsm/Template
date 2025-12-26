import UIKit
import Architecture
import LoginModule


@MainActor
public protocol IntroRouterProtocol: RouterProtocol {
    func attachLogin()    
}


@MainActor
public final class IntroRouter: Router<IntroViewModelProtocol, ViewControllerProtocol>, IntroRouterProtocol {
    
    
    public var dependencies: IntroDependencyProtocol
    private var loginFactory: LoginModuleFactoryProtocol?
    
    init(viewModel: IntroViewModelProtocol,
         viewController: ViewControllerProtocol,
         dependencies: IntroDependencyProtocol
    ) {
        self.dependencies = dependencies
        super.init(viewModel: viewModel,
                   viewController: viewController)
    }
    
    public func attachLogin() {
        if loginFactory == nil {
            let dependencies = LoginDependencies(network: dependencies.network)
            let module = LoginModuleFactory(dependency: dependencies)
            let router = module.build()
            loginFactory = module
            attach(child: router)
            viewController.uiViewController.navigationController?.pushViewController(router.viewController.uiViewController, animated: true)
        }
    }
}
