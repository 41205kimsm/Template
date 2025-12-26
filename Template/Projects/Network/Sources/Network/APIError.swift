//
//  APIError.swift
//  Network
//
//  Created by kimsoomin on 12/9/25.
//

import Foundation

enum APIError: Error {
    case invalidRequest
    case timeout
    case networkError
    case decodingError
    case serverError(statusCode: Int, message: String)
    case unknown(Error)
}
