import Architecture
import LoginService

public protocol LoginViewModelProtocol: ViewModelProtocol  { }

public final class LoginViewModel: ViewModel, LoginViewModelProtocol {
    
    var router: LoginRouterProtocol?
    var service: LoginServiceProtocol
    
    public init(service: LoginServiceProtocol){
        self.service = service
    }
}
