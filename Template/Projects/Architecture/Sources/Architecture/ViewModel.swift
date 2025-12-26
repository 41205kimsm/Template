//
//  ViewModel.swift
//  Architecture
//
//  Created by kimsoomin on 12/5/25.
//

import Foundation

public protocol ViewModelProtocol: AnyObject {
    
}

open class ViewModel: ViewModelProtocol {

    var router: RouterProtocol?
        
    public init() {
        
    }
}
