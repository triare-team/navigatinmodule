//
//  ViewController1.swift
//  BaseAppV2
//
//  Created by Alexander on 09.02.2021.
//

import UIKit
import NavigationModule

class ViewController1: NavigationModuleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: CGFloat.random(in: 100...200)/255, green: CGFloat.random(in: 100...200)/255, blue: CGFloat.random(in: 100...200)/255, alpha: CGFloat.random(in: 100...200)/255).withAlphaComponent(1.0)
    }


    @IBAction func next(_ sender: Any) {
        let m = NavigationSetModel.init(title: "test1", imageName: "title", initialViewControllerType: ViewController2.self)
        self.navigationModule?.endFlow(with: [m, m ,m])
    }

}
