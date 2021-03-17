//
//  MainModuleTabBarController.swift
//  AuthModule
//
//  Created by Alexander on 18.05.2020.
//  Copyright © 2020 triare. All rights reserved.
//

import UIKit

class NavigationSetController: UITabBarController {
    
    var navigationModules: [NavigationModule] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func generateViewControllers() {
        var generatedViewControllers: [UIViewController] = []
        navigationModules.forEach({ (navigationModule) in
            if let viewController = navigationModule.startFlow() {
                generatedViewControllers.append(viewController)
            }
        })
        viewControllers = generatedViewControllers
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
}
