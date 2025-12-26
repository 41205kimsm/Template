import Architecture
import IntroService
import Network

public protocol IntroModuleFactoryProtocol: ModuleFactoryProtocol {
    @MainActor func build() -> RouterProtocol

}

public final class IntroModuleFactory: ModuleFactory<IntroDependencyProtocol>, IntroModuleFactoryProtocol {
    
    public override init(dependency: IntroDependencyProtocol) {
        super.init(dependency: dependency)
    }
    
    public func build() -> any RouterProtocol {
        let vm = IntroViewModel(service: IntroService(network: dependency.network))
        let vc = SwiftUIViewController {
            IntroView(viewModel: vm)
        }
        let router = IntroRouter(viewModel: vm, viewController: vc, dependencies: dependency)        
        vm.router = router
        return router
    }
}

