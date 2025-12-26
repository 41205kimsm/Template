import UIKit
import Architecture


@MainActor
public protocol LoginRouterProtocol: RouterProtocol { }


@MainActor
public final class LoginRouter: Router<LoginViewModelProtocol, LoginViewControllerProtocol>, LoginRouterProtocol {
    
    
    override init(viewModel: LoginViewModelProtocol,
                  viewController: LoginViewControllerProtocol
    ) {
        super.init(viewModel: viewModel,
                   viewController: viewController)
                
    }
}
