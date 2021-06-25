//
//  BaseViewController.swift
//  Nutrihorse
//
//  Created by Alexander on 07.09.2020.
//  Copyright ©  2020 Nutrihorse. All rights reserved.
//

import UIKit

open class NavigationModuleViewController: UIViewController {
    
    var object: Any?
    public var navigationModule: NavigationModule?
    
    deinit {
        print("NavigationModuleViewController \(type(of: self)) deinited")
    }
    
    public init(navigationModule: NavigationModule? = nil, object: Any? = nil, bundle: Bundle?) {
        self.navigationModule = navigationModule
        super.init(nibName: String(describing: type(of: self)), bundle: bundle)
    }
    
    required public init(navigationModule: NavigationModule? = nil, object: Any? = nil) {
        self.navigationModule = navigationModule
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
