//
//  NavigationRouterModuleDelegate.swift
//  AuthModule
//
//  Created by Alexander on 15.05.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import Foundation

protocol NavigationRouterDelegate {
    
    func startNextNavigationModule(with navigationModel: [NavigationModel])
    func switchNavigationModule(to navigationModule: NavigationModule)
}
