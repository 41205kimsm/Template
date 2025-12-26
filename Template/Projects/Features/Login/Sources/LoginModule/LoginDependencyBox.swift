import Architecture
import Network

public struct LoginDependencies: DependencyProtocol {
    public let network: NetworkProtocol
    public init(network: NetworkProtocol) {
        self.network = network
    }
}


