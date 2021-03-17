//
//  File.swift
//  
//
//  Created by Hennadii Shelenhovskyi on 2/22/21.
//

import UIKit

public enum NavigationModuleViewControllerSettings {
    case modalPresentationStyle(UIModalPresentationStyle)
    case animated(Bool)
    case completion((() -> Void)?)
    case withNavigationController(Bool)
}
