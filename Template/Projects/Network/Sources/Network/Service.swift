//
//  Service.swift
//  Network
//
//  Created by kimsoomin on 12/12/25.
//

import Foundation

public protocol ServiceProtocol: AnyObject {
    
}

open class Service: ServiceProtocol {

    public let network: NetworkProtocol

    public init(network: NetworkProtocol) {
        self.network = network
    }
}
