//
//  NavigationModels.swift
//  BaseAppV2
//
//  Created by Alexander on 12.02.2021.
//

import Foundation
import NavigationModule

class NavigatinoModels {
    // tab bar controller models
    static let navigationSetModel1 = NavigationSetModel.init(title: "Title1", imageName: "image_name", initialViewControllerType: ViewController2.self)
    static let navigationSetModel2 = NavigationSetModel.init(title: "Title2", imageName: "image_name", initialViewControllerType: ViewController2.self)
    static let navigationSetModel3 = NavigationSetModel.init(title: "Title3", imageName: "image_name", initialViewControllerType: ViewController2.self)
    
    // navigation controller models
    let navigationModel1 = NavigationModel.init(initialViewControllerType: ViewController1.self)
    let navigationModel2 = NavigationModel.init(initialViewControllerType: ViewController1.self)
    let navigationModel3 = NavigationModel.init(initialViewControllerType: ViewController1.self)
}
