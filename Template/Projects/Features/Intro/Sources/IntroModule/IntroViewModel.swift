import Architecture
import IntroService
import SwiftUI

public protocol IntroViewModelProtocol: ViewModelProtocol  {
    init (service: IntroServiceProtocol)
}

public final class IntroViewModel: ViewModel, IntroViewModelProtocol, ObservableObject {
    
    var router: IntroRouterProtocol?     
    var service: IntroServiceProtocol
    
    public init(service: IntroServiceProtocol){
        self.service = service
        super.init()
        checkPermisssions()
    }
    
    func checkPermisssions() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            self.router?.attachLogin()
        })
    }
    
}
