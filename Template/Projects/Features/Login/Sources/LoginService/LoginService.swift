import Foundation
import Network

public protocol LoginServiceProtocol: ServiceProtocol {
    
}

public final class LoginService: Service, LoginServiceProtocol {
    public override init(network: any NetworkProtocol) {
        super.init(network: network)
    }

}


struct LoginRequest: APIRequest {
    typealias Response = LoginResponse
    
    var url: URL?
    var method: APIMethod
    var parameters: QueryItems?
    var headers: APIHeaders?
    var isMultiPart: Bool
    
    init(parameters: [String: AnyHashable]?){
        self.url = URL(string: APIConstant.Login.reqLogin)
        self.method = .post
        self.parameters = parameters
        self.isMultiPart = false
    }
}


struct LoginResponse: Decodable {
    var name: String
}
