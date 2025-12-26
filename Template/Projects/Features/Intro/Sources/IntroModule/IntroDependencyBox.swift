import Architecture
import Network

public protocol IntroDependencyProtocol: DependencyProtocol {
    var network: NetworkProtocol { get }
}


public class IntroDependencies: DependencyBox<IntroDependencyProtocol>, IntroDependencyProtocol {
    public var network: any NetworkProtocol
        
    public override init(dependency: any IntroDependencyProtocol) {
        self.network = dependency.network
        super.init(dependency: dependency)
    }
}

