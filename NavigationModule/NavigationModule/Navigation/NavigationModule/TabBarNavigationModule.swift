//
//  TabBarNavigationModule.swift
//  NavigationModule
//
//  Created by Alexander on 11.02.2021.
//

import Foundation
import UIKit

class TabBarNavigationModule: NavigationModule {
    override func builder(for navigationModels: [NavigationModel], with object: Any?) -> UINavigationController {
        let tabBarController = NavigationSetController.init()
        
        navigationModels.forEach { (navigationModel) in
            tabBarController.navigationModules.append(NavigationModuleBuilder.build(navigationModels: [navigationModel], navigationRouterDelegate: self.navigationRouterModuleDelegate))
        }
        
        tabBarController.generateViewControllers()

        navigationController.setViewControllers([tabBarController], animated: false)
        return navigationController
    }
}
