import Foundation

public protocol DependencyProtocol { }

open class DependencyBox<DependencyType>: DependencyProtocol {
    public let dependency: DependencyType
    
    public init(dependency: DependencyType) {
        self.dependency = dependency
    }
}

public class EmptyDependency: DependencyProtocol { }

public class EmptyDependencyBox: EmptyDependency {
    public override init() {
    }
}

// MARK: - DIContainer

public final class DIContainer {
    public static var shared: DIContainer = DIContainer()

    private let lock = DispatchQueue(label: "di.container.lock")
    
    // 저장소: key -> factory closure (which may produce a singleton or transient)
    private var factories: [String: () -> Any] = [:]
    
    // 싱글턴 인스턴스 캐시
    private var singletons: [String: Any] = [:]
    
    public init() {}
    
    // MARK: - Registration
    
    /// Register singleton (laz    y)
    public func registerSingleton<Service>(_ type: Service.Type, factory: @escaping () -> Service) {
        let key = keyFor(type)
        lock.sync {
            factories[key] = { [weak self] in
                if let existing = self?.singletons[key] as? Service {
                    return existing
                }
                let instance = factory()
                self?.singletons[key] = instance
                return instance
            }
        }
    }
    
    /// Register transient/factory: returns a new instance each time
    public func registerFactory<Service>(_ type: Service.Type, factory: @escaping () -> Service) {
        let key = keyFor(type)
        lock.sync {
            factories[key] = {
                return factory()
            }
        }
    }
    
    /// Register an arbitrary value (instance)
    public func registerInstance<Service>(_ type: Service.Type, instance: Service) {
        let key = keyFor(type)
        lock.sync {
            singletons[key] = instance
            factories[key] = { [instance] in instance }
        }
    }
    
    // MARK: - Resolve
    
    public func resolve<Service>(_ type: Service.Type) -> Service {
        let key = keyFor(type)
        return lock.sync {
            guard let factory = factories[key] else {
                fatalError("❌ No registration for '\(key)'. Did you forget to register the dependency?")
            }
            guard let instance = factory() as? Service else {
                fatalError("❌ Registered factory for '\(key)' returned a wrong type.")
            }
            return instance
        }
    }
    
    // Try resolve (optional)
    public func tryResolve<Service>(_ type: Service.Type) -> Service? {
        let key = keyFor(type)
        return lock.sync {
            guard let factory = factories[key] else { return nil }
            return factory() as? Service
        }
    }
    
    // MARK: - Helpers
    
    private func keyFor<T>(_ type: T.Type) -> String {
        return String(reflecting: type)
    }
    
    // Reset container (useful for tests)
    public func reset() {
        lock.sync {
            factories.removeAll()
            singletons.removeAll()
        }
    }
    
    // Replace shared container (for tests)
    public static func setShared(_ container: DIContainer) {
        shared = container
    }
}


// MARK: - @Injected Property Wrapper

@propertyWrapper
public struct Injected<Service> {
    private var service: Service
    
    public var wrappedValue: Service {
        get { service }
        mutating set { service = newValue }
    }
    
    public init() {
        self.service = DIContainer.shared.resolve(Service.self)
    }
}
