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
    
    public required init(navigationRouterModuleDelegate: NavigationRouterDelegate, navigationModels: [NavigationModel]?) {
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
    
    public func present(by navigationModel: NavigationModel?) {
        guard let navigationModel = navigationModel else { return }
        let navigationModule = NavigationModule.init(navigationRouterModuleDelegate: self.navigationRouterModuleDelegate, navigationModels: [navigationModel])
        guard let presentedNavigationController = navigationModule.startFlow() else { return }
        navigationController.present(presentedNavigationController, animated: true, completion: nil)
    }
    
    public func dismiss() {
        guard let presentingViewController = navigationController.presentingViewController else {return}
        presentingViewController.dismiss(animated: true, completion: nil)
    }
}

