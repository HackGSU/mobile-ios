//
//  ViewController.swift
//  hackGSU
//
//  Created by Harsha Goli on 9/24/16.
//  Copyright © 2016 hackGSU. All rights reserved.
//

import UIKit
import BATabBarController

class ViewController: UIViewController {
    var baTabBarController: BATabBarController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        //
        let tabBarItem1 = BATabBarItem(image: UIImage(named: "ic_List_unselected"), selectedImage: UIImage(named: "ic_List"))
        let tabBarItem2 = BATabBarItem(image: UIImage(named: "ic_Request_unselected"), selectedImage: UIImage(named: "ic_Request"))
        let tabBarItem3 = BATabBarItem(image: UIImage(named: "ic_Profile_unselected"), selectedImage: UIImage(named: "ic_Profile"))
        
        baTabBarController = BATabBarController()
        baTabBarController.viewControllers = [vc1,vc2,vc3]
        baTabBarController.tabBarItems = [tabBarItem1!,tabBarItem2!,tabBarItem3!]
        baTabBarController.delegate = TabBarDelegate()
        baTabBarController.tabBarBackgroundColor = UIColor.black
        baTabBarController.tabBarItemStrokeColor = UIColor.red
        baTabBarController.setSelectedView(vc1, animated: true)
        self.view.addSubview(baTabBarController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class TabBarDelegate: NSObject, BATabBarControllerDelegate {
    public func tabBarController(_ tabBarController: BATabBarController!, didSelect viewController: UIViewController!){
        
    }
}

