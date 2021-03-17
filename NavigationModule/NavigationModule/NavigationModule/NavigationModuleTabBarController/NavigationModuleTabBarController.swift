//
//  File.swift
//  
//
//  Created by Hennadii Shelenhovskyi on 2/22/21.
//

import UIKit

public typealias NavigationModuleTabBarControllerType = UITabBarController & NavigationModuleTabBarControllerProtocol
public typealias NavigationModuleTabBarViewControllerType = NavigationModuleTabBarControllerType & NavigationModuleViewControllerProtocol

public protocol NavigationModuleTabBarControllerProtocol {
    var navigationModules: [NavigationModule] { get set }
    var navigationModels: [NavigationModel] { get set }
}

open class NavigationModuleTabBarController: NavigationModuleTabBarViewControllerType {
    
    public var object: Any?
    
    public var navigationModules: [NavigationModule] = []
    
    public var navigationModels: [NavigationModel] = []
    
    public unowned var navigationModule: NavigationModule?
    
    required public init(navigationModule: NavigationModule?, object: Any?) {
        self.navigationModule = navigationModule
        self.object = object
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setupTabBar() {
        
        navigationModels.forEach { (navigationModel) in
            if let navigationRouterModuleDelegate = navigationModule?.navigationRouterModuleDelegate {
                navigationModules.append(NavigationModuleBuilder.build(navigationModels: [navigationModel], navigationRouterDelegate: navigationRouterModuleDelegate))
            }
        }
        
        var generatedViewControllers: [UIViewController] = []
        navigationModules.forEach({ (navigationModule) in
            if let viewController = navigationModule.startFlow() {
                generatedViewControllers.append(viewController)
            }
        })
        
        viewControllers = generatedViewControllers
    }
    
}
