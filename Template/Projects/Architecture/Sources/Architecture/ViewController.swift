//
//  ViewController.swift
//  Architecture
//
//  Created by kimsoomin on 12/8/25.
//

import UIKit


public protocol ViewControllerProtocol {
    var uiViewController: UIViewController { get }
}

open class ViewController: UIViewController, ViewControllerProtocol {
    public var uiViewController: UIViewController {
        return self
    }

    var viewModel: ViewModelProtocol?
        
    public init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel        
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        print("🏭ViewController: \(String(describing: type(of: self)))")
    }
}

