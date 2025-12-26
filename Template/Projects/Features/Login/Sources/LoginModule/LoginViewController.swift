import UIKit
import Combine
import Architecture
import DesignSystem
import CommonUI
import Extensions
import Lottie
import SnapKit

public protocol LoginViewControllerProtocol: ViewControllerProtocol {}


final class LoginViewController: ViewController, LoginViewControllerProtocol {
        
    private var cancellables: Set<AnyCancellable> = []
    
    public override init(viewModel: any ViewModelProtocol) {
        super.init(viewModel: viewModel)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setup()
        laytout()
        bind()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setup() {
        view.backgroundColor = .green
    }
    
    private func laytout() {
        
    }
    
    private func bind() {
        
    }
}

