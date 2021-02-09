//
//  NavigationRouterModule.swift
//  AuthModule
//
//  Created by Alexander on 14.05.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import Foundation
import UIKit

public class NavigationRouter {
    
    private var window: UIWindow!
    
    private var navigationController: UINavigationController = UINavigationController()
    private var currentModule: NavigationModule?
    
    public init(in window: UIWindow) {
        self.window = window
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func getCurrentModule() throws -> NavigationModule {
        if let currentModule = self.currentModule {
            return currentModule
        } else {
            throw NavigationRouterModuleErrors.missingCurrentModule
        }
    }
    
    func getNavigationController() -> UINavigationController {
        return navigationController
    }
    
    public func startNavigationModuleFrom(_ navigationModel: NavigationModel) {
        let navigationModuleAbstract = NavigationModule.init(navigationRouterModuleDelegate: self, navigationModels: [navigationModel])
        window.rootViewController = navigationModuleAbstract.startFlow()
        
        currentModule = navigationModuleAbstract
    }
    
    func changeNavigationModule(with navigationModels: [NavigationModel]) {
        let navigationModuleAbstract = NavigationModuleBuilder.build(navigationModels: navigationModels, navigationRouterDelegate: self)
        
        currentModule = navigationModuleAbstract
        UIView.transition(with: self.window!, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.window.rootViewController = navigationModuleAbstract.startFlow()
        }, completion: nil)
    }
    
}

extension NavigationRouter: NavigationRouterDelegate {
    
    func startNextNavigationModule(with navigationModel: [NavigationModel]) {
        changeNavigationModule(with: navigationModel)
    }
    
    func switchNavigationModule(to navigationModule: NavigationModule) {
        currentModule = navigationModule
    }
}


