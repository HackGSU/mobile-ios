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
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var topBarLabel: UILabel!
    var tabBar: BATabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidLayoutSubviews() {
        
        var vc1 = announcementFeedController(collectionViewLayout: UICollectionViewFlowLayout())
        var vc2 = storyboard?.instantiateViewController(withIdentifier: "Schedule")
        var vc3 = storyboard?.instantiateViewController(withIdentifier: "Maps")
        
        //If these tabBar items are not set (even if there are no images) the entire bar does not show
        let tabBarItem1 = BATabBarItem(image: UIImage(named: "alert"), selectedImage: UIImage(named: "alert_filled"))
        let tabBarItem2 = BATabBarItem(image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar_filled"))
        let tabBarItem3 = BATabBarItem(image: UIImage(named: "map"), selectedImage: UIImage(named: "map_filled"))
        
        self.tabBar = BATabBarController()
        //tab bar background color
        self.tabBar.tabBarBackgroundColor = UIColor.black;
        //tab bar item stroke color
        self.tabBar.tabBarItemStrokeColor = UIColor.red;
        //Tab bar line width example
        //self.vc.tabBarItemLineWidth = 1.0;
        self.tabBar.viewControllers = [vc1, vc2!, vc3!]
        self.tabBar.tabBarItems = [tabBarItem1!, tabBarItem2!, tabBarItem3!]
        self.tabBar.setSelectedView(vc1, animated: false)
        self.tabBar.delegate = self
        self.view.addSubview(self.tabBar.view)
        //topBar.layer.zPosition = 1
    
    }
    
    func tabBarController(_ tabBarController: BATabBarController, didSelect viewController: UIViewController) {
        print("Delegate success!")
        
        
        switch viewController.restorationIdentifier! {
            case "Announcements":
                UIView.animate(withDuration: 1.0, animations: { () -> Void in
                    self.tabBar.tabBarBackgroundColor = UIColor.white
                    //self.topBar.backgroundColor = UIColor.blue
                    //self.tabBar.tabBarItemStrokeColor = UIColor.white;
                    //self.topBarLabel.text = "Announcements"
                })
            break
            case "Schedule":
                UIView.animate(withDuration: 1.0, animations: { () -> Void in
                    self.tabBar.tabBarBackgroundColor = UIColor.cyan
                    //self.topBar.backgroundColor = UIColor.white
                    //self.tabBar.tabBarItemStrokeColor = UIColor.blue
                    //self.topBarLabel.text = "Schedule"
                })
            break
            case "Maps":
                UIView.animate(withDuration: 1.0, animations: { () -> Void in
                    self.tabBar.tabBarBackgroundColor = UIColor.red
                    //self.topBar.backgroundColor = UIColor.lightGray
                    //self.tabBar.tabBarItemStrokeColor = UIColor.white
                    //self.topBarLabel.text = "Maps"
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

