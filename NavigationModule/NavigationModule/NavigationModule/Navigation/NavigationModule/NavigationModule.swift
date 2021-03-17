//
//  NavigationModuleInterface.swift
//  AuthModule
//
//  Created by Alexander on 14.05.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import Foundation
import UIKit

open class NavigationModule {
    
    private(set) var navigationRouterModuleDelegate: NavigationRouterDelegate!
    
    private(set) var navigationController: UINavigationController = UINavigationController()
    
    private(set) var navigationModels: [NavigationModel]?
    
    private weak var presentedNavigationController: UINavigationController!
    
    required public init(navigationRouterModuleDelegate: NavigationRouterDelegate, navigationModels: [NavigationModel]?) {
        self.navigationRouterModuleDelegate = navigationRouterModuleDelegate
        self.navigationModels = navigationModels
    }
    
    func startFlow() -> UINavigationController? {
        guard let navigationModels = navigationModels else { return nil }
        return builder(for: navigationModels)
    }
    
    func builder(for navigationModels: [NavigationModel]) -> UINavigationController {
        if let navigationModel = navigationModels.first {
            navigationController = navigationModel.buildComponent(in: self)
        }
        return navigationController
    }
    
    public func endFlow(with nextNavigationModel: [NavigationModel]) {
        navigationRouterModuleDelegate.startNextNavigationModule(with: nextNavigationModel)
    }
    
    public func pushViewController<T : NavigationModuleViewController>(_ viewController: T.Type, object: Any?) {
        let viewController = viewController.init(navigationModule: self, object: object)
        viewController.object = object
        (presentedNavigationController ?? navigationController).pushViewController(viewController, animated: true)
    }
    
    public func popViewController() {
        (presentedNavigationController ?? navigationController).popViewController(animated: true)
    }
    
    public func popToRootViewController() {
        (presentedNavigationController ?? navigationController).popToRootViewController(animated: true)
    }
    
    public func endFlow(animated: Bool = true, completion: (() -> Void)? = nil) {
        (presentedNavigationController ?? navigationController).dismiss(animated: animated, completion: completion)
    }
    
    func prepareViewControllerSettings(_ settings: [NavigationModuleViewControllerSettings], _ modalPresentationStyle: inout UIModalPresentationStyle, _ animated: inout Bool, _ completion: inout (() -> ())?, _ withNavigationController: inout Bool) {
        for setting in settings {
            switch setting {
                case .modalPresentationStyle(let style):
                    modalPresentationStyle = style
                case .animated(let isAnimated):
                    animated = isAnimated
                case .completion(let callback):
                    completion = callback
                case .withNavigationController(let addNavigationController):
                    withNavigationController = addNavigationController
            }
        }
    }
    
    public func presentViewController<T: NavigationModuleViewController>(_ viewController: T.Type, object: Any?, settings: [NavigationModuleViewControllerSettings] = []) {
        var modalPresentationStyle: UIModalPresentationStyle = .popover
        var animated = true
        var completion: (() -> Void)?
        var withNavigationController = false
        prepareViewControllerSettings(settings, &modalPresentationStyle, &animated, &completion, &withNavigationController)
        
        if withNavigationController {
            let nextNavigationController: UINavigationController? = UINavigationController(rootViewController: viewController.init(navigationModule: self, object: object))
            presentedNavigationController = nextNavigationController
            
            presentedNavigationController?.modalPresentationStyle = modalPresentationStyle
            if presentedNavigationController != nil {
                navigationController.present(presentedNavigationController,
                                             animated: animated,
                                             completion: completion)
            }
        } else {
            let viewController = viewController.init(navigationModule: self, object: object)
            viewController.modalPresentationStyle = modalPresentationStyle
            (presentedNavigationController ?? navigationController).present(viewController,
                                                                            animated: animated,
                                                                            completion: completion)
        }
        
    }
}
