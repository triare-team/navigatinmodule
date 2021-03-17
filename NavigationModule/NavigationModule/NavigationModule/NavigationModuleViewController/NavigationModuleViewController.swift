//
//  BaseViewController.swift
//  Nutrihorse
//
//  Created by Alexander on 07.09.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import UIKit

public typealias NavigationModuleViewControllerType = UIViewController & NavigationModuleViewControllerProtocol

public protocol NavigationModuleViewControllerProtocol where Self: UIViewController {
    var navigationModule: NavigationModule? { get set }
    var object: Any? { get set }
    init(navigationModule: NavigationModule?, object: Any?)
}

public extension NavigationModuleViewControllerProtocol {
    init(navigationModule: NavigationModule? = nil, object: Any? = nil) {
        self.init(navigationModule: nil, object: nil)
    }
}

open class NavigationModuleViewController: NavigationModuleViewControllerType {
    
    public var object: Any?
    public unowned var navigationModule: NavigationModule?
    
    deinit {
        print("\(type(of: self)) deinited")
    }
    
    required public init(navigationModule: NavigationModule? = nil, object: Any? = nil) {
        self.navigationModule = navigationModule
        self.object = object
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func endEdit() {
        self.view.endEditing(true)
    }
    
}
