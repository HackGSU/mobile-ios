//
//  BATabBarController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/7/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import BATabBarController

class BATabBarViewController: UIViewController, BATabBarControllerDelegate {
    /**
     Delegate method used to add external actions to a tab click
     
     @param tabBarController
     Tab bar controller housing all tabs, views, and controllers
     @param viewController
     Specific view controller chosen
     */
    @available(iOS 2.0, *)
    public func tabBarController(_ tabBarController: BATabBarController!, didSelect viewController: UIViewController!) {
        print(123)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
