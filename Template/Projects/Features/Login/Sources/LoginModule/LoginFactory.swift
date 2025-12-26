import Architecture
import LoginService
import Network

public protocol LoginModuleFactoryProtocol: ModuleFactoryProtocol {
    @MainActor func build() -> RouterProtocol

}

public final class LoginModuleFactory: ModuleFactory<LoginDependencies>, LoginModuleFactoryProtocol {
    
    public override init(dependency: LoginDependencies) {
        super.init(dependency: dependency)
    }
    
    public func build() -> any RouterProtocol {
        let vm = LoginViewModel(service: LoginService(network: dependency.network))
        let vc = LoginViewController(viewModel: vm)
        let router = LoginRouter(viewModel: vm, viewController: vc)
        vm.router = router
        return router
    }
}

