//
//  ViewController.swift
//  hackGSU
//
//  Created by Harsha Goli on 9/24/16.
//  Copyright © 2016 hackGSU. All rights reserved.
//

import UIKit
import BATabBarController

class TabBarViewController: UIViewController, BATabBarControllerDelegate {
    
    var vc: BATabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidLayoutSubviews() {
        
        var vc1 = storyboard?.instantiateViewController(withIdentifier: "Announcements")
        var vc2 = storyboard?.instantiateViewController(withIdentifier: "Schedule")
        var vc3 = storyboard?.instantiateViewController(withIdentifier: "Maps")
        
        //If these tabBar items are not set (even if there are no images) the entire bar does not show
        let tabBarItem1 = BATabBarItem(image: UIImage(named: "ic_List_unselected"), selectedImage: UIImage(named: "ic_List"))
        let tabBarItem2 = BATabBarItem(image: UIImage(named: "ic_Request_unselected"), selectedImage: UIImage(named: "ic_Request"))
        let tabBarItem3 = BATabBarItem(image: UIImage(named: "ic_Profile_unselected"), selectedImage: UIImage(named: "ic_Profile"))
        
        self.vc = BATabBarController()
        //tab bar background color
        self.vc.tabBarBackgroundColor = UIColor.black;
        //tab bar item stroke color
        self.vc.tabBarItemStrokeColor = UIColor.red;
        //Tab bar line width example
        //self.vc.tabBarItemLineWidth = 1.0;
        self.vc.viewControllers = [vc1!, vc2!, vc3!]
        self.vc.tabBarItems = [tabBarItem1!, tabBarItem2!, tabBarItem3!]
        self.vc.setSelectedView(vc2, animated: false)
        self.vc.delegate = self
        self.view.addSubview(self.vc.view)
    
    }
    
    func tabBarController(_ tabBarController: BATabBarController, didSelect viewController: UIViewController) {
        print("Delegate success!")
        
        switch viewController.restorationIdentifier! {
            case "Announcements":
                UIView.animate(withDuration: 1.0, animations: { () -> Void in
                    self.vc.tabBarBackgroundColor = UIColor.blue
                })
            break
            case "Schedule":
                UIView.animate(withDuration: 1.0, animations: { () -> Void in
                    self.vc.tabBarBackgroundColor = UIColor.red
                })
            break
            case "Maps":
                UIView.animate(withDuration: 1.0, animations: { () -> Void in
                    self.vc.tabBarBackgroundColor = UIColor.green
                })
            break
        default:
            //We really shouldn't be here
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

