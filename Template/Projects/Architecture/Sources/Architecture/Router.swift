/**
 @module:
 @author: kimsm
 @since:
 @desc
 @remark
 */

@MainActor public protocol RouterProtocol: AnyObject {
    var viewController:  any ViewControllerProtocol { get set }
    var viewModel:  any ViewModelProtocol { get set }
    var childrens: [any RouterProtocol] { get }
    
    func attach(child: any RouterProtocol)
    func detach(child: any RouterProtocol)
}

open class Router<VM, VC>: RouterProtocol {

    public var viewModel: any ViewModelProtocol
    public var viewController: any ViewControllerProtocol

    public var viewModelType: VM
    public var viewControllerType: VC

    public var childrens: [any RouterProtocol] = []

    public init(viewModel: VM,
                viewController: VC) {

        self.viewModelType = viewModel
        self.viewControllerType = viewController

        guard let vm = viewModel as? ViewModelProtocol, let vc = viewController as? ViewControllerProtocol else {
            
            fatalError()
        }
        self.viewModel = vm
        self.viewController = vc
    }

    public func attach(child: any RouterProtocol) {
        childrens.append(child)
    }

    public func detach(child: any RouterProtocol) {
        guard let idx = childrens.firstIndex(where: { $0 as AnyObject === child as AnyObject }) else {
            return
        }
        childrens.remove(at: idx)
    }
}

