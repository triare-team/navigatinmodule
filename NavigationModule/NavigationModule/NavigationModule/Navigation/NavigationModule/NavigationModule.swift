//
//  NavigationModuleInterface.swift
//  AuthModule
//
//  Created by Alexander on 14.05.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import Foundation
import UIKit

public class NavigationModule {
    
    private(set) var navigationRouterModuleDelegate: NavigationRouterDelegate!
    
    private(set) var navigationController: UINavigationController = UINavigationController()
    
    private(set) var navigationModels: [NavigationModel]?
    
    required init(navigationRouterModuleDelegate: NavigationRouterDelegate, navigationModels: [NavigationModel]?) {
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
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func popViewController() {
        navigationController.popViewController(animated: true)
    }
}

