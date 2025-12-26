import Foundation
import Network

public protocol IntroServiceProtocol: ServiceProtocol {
    
}

public final class IntroService: Service, IntroServiceProtocol {
    public override init(network: any NetworkProtocol) {
        super.init(network: network)
    }

}
