//
//  MainBottomNavigationModel.swift
//  AuthModule
//
//  Created by Alexander on 18.05.2020.
//  Copyright © 2020 triare. All rights reserved.
//

import Foundation
import UIKit

public class NavigationSetModel: NavigationModel {
    var title: String?
    var imageName: String?
    
    public init(title: String?, imageName: String?, initialViewControllerType: NavigationModuleViewController.Type) {
        self.title = title
        self.imageName = imageName
        super.init(initialViewControllerType: initialViewControllerType)
    }
    
    override func buildComponent(in navigationModule: NavigationModule) -> UINavigationController {
        let tabBarItem = UITabBarItem.init(title: title, image: UIImage(named: imageName ?? ""), tag: 0)
        let navigationController = UINavigationController.init(rootViewController: initialViewControllerType.init(navigationModule: navigationModule))
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
}
