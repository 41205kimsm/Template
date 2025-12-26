//
//  Request.swift
//  Network
//
//  Created by kimsoomin on 12/9/25.
//

import Foundation


public enum APIMethod: String, Encodable {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
}

public typealias QueryItems = [String: AnyHashable]
public typealias APIHeaders = [String: String]

public protocol APIRequest: Hashable {
    associatedtype Response: Decodable
    
    var url: URL? { get }
    var method: APIMethod { get }
    var parameters: QueryItems? { get }
    var headers: APIHeaders? { get }
    var isMultiPart: Bool { get }
}


