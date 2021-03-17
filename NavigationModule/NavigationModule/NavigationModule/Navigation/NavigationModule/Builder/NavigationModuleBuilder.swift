//
//  NavigationModuleBuilder.swift
//  NavigationModule
//
//  Created by Alexander on 11.02.2021.
//

import Foundation
import UIKit

class NavigationModuleBuilder {
    static func build(navigationModels: [NavigationModel], navigationRouterDelegate: NavigationRouterDelegate) -> NavigationModule {
        
        if navigationModels.count > 1 {
            return TabBarNavigationModule.init(navigationRouterModuleDelegate: navigationRouterDelegate, navigationModels: navigationModels)
        } else {
            return NavigationModule.init(navigationRouterModuleDelegate: navigationRouterDelegate, navigationModels: navigationModels)
        }
    }
}
