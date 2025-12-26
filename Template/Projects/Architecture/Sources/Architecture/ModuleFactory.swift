//
//  ModuleFactory.swift
//  Architecture
//
//  Created by kimsoomin on 12/8/25.
//

import Foundation


public protocol ModuleFactoryProtocol: AnyObject { }

open class ModuleFactory<DependencyType>: ModuleFactoryProtocol {
    
    public let dependency: DependencyType
    
    public init(dependency: DependencyType) {
        self.dependency = dependency
    }
}
