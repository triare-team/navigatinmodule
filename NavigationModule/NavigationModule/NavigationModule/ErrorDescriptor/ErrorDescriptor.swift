//
//  ErrorDescriptor.swift
//  AuthModule
//
//  Created by Alexander on 16.05.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import Foundation

class ErrorDescriptor {
    static func description(error: Error) -> String {
        switch error {
        case is ErrorInterface:
            let error = error as! ErrorInterface
            return error.errorDescription
        default:
            return error.localizedDescription
        }
    }
}

