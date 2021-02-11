//
//  ViewController1.swift
//  BaseAppV2
//
//  Created by Alexander on 09.02.2021.
//

import UIKit
import NavigationModule

class ViewController1: NavigationModuleViewController {
    
    var counter: Int?
    
    required init(navigationModule: NavigationModule? = nil, object: Any? = nil) {
        super.init(navigationModule: navigationModule, object: object)
        if let counter = (object as? Int) {
            self.counter = counter
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: CGFloat.random(in: 100...200)/255, green: CGFloat.random(in: 100...200)/255, blue: CGFloat.random(in: 100...200)/255, alpha: CGFloat.random(in: 100...200)/255).withAlphaComponent(1.0)
    }


    @IBAction func next(_ sender: Any) {
        let navigationSetModel1 = NavigationSetModel.init(title: "Title1", imageName: "image_name", initialViewControllerType: ViewController2.self)
        let navigationSetModel2 = NavigationSetModel.init(title: "Title2", imageName: "image_name", initialViewControllerType: ViewController2.self)
        let navigationSetModel3 = NavigationSetModel.init(title: "Title3", imageName: "image_name", initialViewControllerType: ViewController2.self)
        self.navigationModule?.endFlow(with: [navigationSetModel1, navigationSetModel2 ,navigationSetModel3])
    }

}
