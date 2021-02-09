//
//  NavigationRouterModuleErrors.swift
//  AuthModule
//
//  Created by Alexander on 15.05.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import Foundation

enum NavigationRouterModuleErrors: String, Error {
    
    case missingCurrentModule
    
    var description: String {
        switch self {
            case .missingCurrentModule:
                return "Cannot find current navigation module"
        }
    }
    
    var localizedDescription: String {
        return description
    }
}
