//
//  AlamofireRequest.swift
//  Network
//
//  Created by kimsoomin on 12/12/25.
//

import Foundation
import Alamofire

public protocol AlamofireRequest {
    associatedtype Response: Decodable

    var url: URL? { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

public struct DefaultAlamofireRequest<Response: Decodable>: AlamofireRequest {
    public let url: URL?
    public let method: HTTPMethod
    public let parameters: Parameters?
    public let headers: HTTPHeaders?
    public let encoding: ParameterEncoding
    
    public init(
        url: URL?,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?,
        encoding: ParameterEncoding
    ) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.encoding = encoding
    }
}
