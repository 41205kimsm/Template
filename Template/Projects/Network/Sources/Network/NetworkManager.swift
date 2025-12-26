//
//  NetworkManager.swift
//  Network
//
//  Created by kimsoomin on 12/5/25.
//

import UIKit
import Alamofire

public protocol NetworkProtocol {
    func request<R: APIRequest>(_ request: R) async throws -> R.Response?
}

public final class NetworkManager: NetworkProtocol {

    private let session: Session
    
    public init(urlSession: URLSession) {
        self.session = Session(configuration: urlSession.configuration)
    }
        
    private func getCommonHeader() -> HTTPHeaders {
        var headers: HTTPHeaders = ["Content-Type": "application/json"]
        return headers
    }
    
    // MARK: Request
    public func request<R: APIRequest>(_ request: R) async throws -> R.Response? {
        let afReq = toAlamofireRequest(request: request)

        // URL 체크
        guard let url = afReq.url else {
            throw APIError.invalidRequest
        }
        
        // 네트워크 체크
        if checkNetworkStatus() == false {
            throw APIError.networkError
        }
        
        // Header
        var finalHeaders = getCommonHeader()
        if let customHeaders = afReq.headers {
            for header in customHeaders {
                finalHeaders.add(header)
            }
        }
                
        let dataResponse = await session.request(
            url,
            method: afReq.method,
            parameters: afReq.parameters,
            encoding: afReq.encoding,
            headers: finalHeaders
        )
        .serializingData()
        .response
                
        switch dataResponse.result {
        case .success(let data):
            // 빈 응답 처리
            if data.isEmpty {
                return nil
            }

            do {
                let decoded = try JSONDecoder().decode(R.Response.self, from: data)
                return decoded
            } catch let decodeError {
                print("❌ JSON Decode Error:", decodeError)
                throw APIError.decodingError
            }
            
        case .failure(let error):
            print("❌ AF Error:", error)
            
            if error.isTimeout {
                throw APIError.timeout
            }            
            throw APIError.unknown(error)
        }
    }
           
    /**
     *
     */
    func checkNetworkStatus() -> Bool {
        guard let manager = NetworkReachabilityManager.default else { return true }
        return manager.isReachable
    }
    
    func toAlamofireRequest<R: APIRequest>(request: R) -> DefaultAlamofireRequest<R.Response>
    {
        
        let afParameters: Parameters? = request.parameters?.reduce(into: [:]) { result, item in
            result[item.key] = item.value
        }
        
        let afHeaders: HTTPHeaders? = request.headers.map { HTTPHeaders($0) }
        
        let encoding: ParameterEncoding = {
            switch request.method {
            case .get: return URLEncoding.default
            default:   return JSONEncoding.default
            }
        }()
        
        return DefaultAlamofireRequest<R.Response>(
            url: request.url,
            method: HTTPMethod(rawValue: request.method.rawValue),
            parameters: afParameters,
            headers: afHeaders,
            encoding: encoding
        )
    }
}

extension AFError {
    var isTimeout: Bool {
        if isSessionTaskError,
           let error = underlyingError as NSError?,
           error.code == NSURLErrorTimedOut //-1001
        {
            return true
        }
        return false
    }
}
