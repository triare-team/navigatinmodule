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
    
    private var currentModule: NavigationModule?
    
    public init(in window: UIWindow) {
        self.window = window
    }
    
    public func startNavigationModuleFrom(_ navigationModel: NavigationModel) {
        let navigationModuleAbstract = NavigationModule.init(navigationRouterModuleDelegate: self, navigationModels: [navigationModel])
        window.rootViewController = navigationModuleAbstract.startFlow()
        
        currentModule = navigationModuleAbstract
    }
    
    func changeNavigationModule(with navigationModels: [NavigationModel]) {
        let navigationModuleAbstract = NavigationModuleBuilder.build(navigationModels: navigationModels, navigationRouterDelegate: self)
        
        currentModule = navigationModuleAbstract
        self.window.rootViewController = navigationModuleAbstract.startFlow()
    }
    
}

extension NavigationRouter: NavigationRouterDelegate {
    
    func startNextNavigationModule(with navigationModel: [NavigationModel]) {
        changeNavigationModule(with: navigationModel)
    }
}


