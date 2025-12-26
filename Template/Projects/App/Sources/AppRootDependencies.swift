import Network
import IntroModule

final class AppRootDependency: IntroDependencyProtocol {

    let network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }
}
