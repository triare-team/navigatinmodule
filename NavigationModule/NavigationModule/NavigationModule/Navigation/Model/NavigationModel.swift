//
//  NavigationModel.swift
//  BaseAppV2
//
//  Created by Alexander on 08.02.2021.
//

import Foundation
import UIKit

public class NavigationModel {
    private(set) var initialViewControllerType: NavigationModuleViewControllerProtocol.Type
    
    public init(initialViewControllerType: NavigationModuleViewControllerProtocol.Type) {
        self.initialViewControllerType = initialViewControllerType
    }
    
    func buildComponent(in navigationModule: NavigationModule) -> UINavigationController {
        return UINavigationController.init(rootViewController: initialViewControllerType.init(navigationModule: navigationModule, object: nil))
    }
}
