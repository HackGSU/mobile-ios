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
    
    var tabBar: BATabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStatusBar()
    }
    
    
    let statusBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    func setupStatusBar(){
        view.addSubview(statusBar)
        statusBar.layer.zPosition = 1
        
        statusBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        statusBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        statusBar.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let tabBarItem1: BATabBarItem = {
        let tabBarItem = BATabBarItem(image: UIImage(named: "alert_unselected")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "alert"))
        return tabBarItem!
    }()
    
    let tabBarItem2: BATabBarItem = {
        let tabBarItem = BATabBarItem(image: UIImage(named: "calendar_unselected")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "calendar"))
        
        return tabBarItem!
    }()
    let tabBarItem3: BATabBarItem = {
        let tabBarItem = BATabBarItem(image: UIImage(named: "map")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "map"))
        return tabBarItem!
    }()
        
    override func viewDidLayoutSubviews() {
        
        let vc1 = UINavigationController(rootViewController: announcementFeedController(collectionViewLayout: UICollectionViewFlowLayout()))
        vc1.title = "Announcements"
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "Schedule")
        vc2?.title = "Schedule"
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "Maps")
        vc3?.title = "Maps"
        
        //If these tabBar items are not set (even if there are no images) the entire bar does not show
        
        self.tabBar = BATabBarController()
        self.tabBar.tabBarItemStrokeColor = .white;
        //Tab bar line width example
        //self.vc.tabBarItemLineWidth = 1.0;
        self.tabBar.viewControllers = [vc1, vc2!, vc3!]
        self.tabBar.tabBarItems = [tabBarItem1, tabBarItem2, tabBarItem3]
        self.tabBar.setSelectedView(vc1, animated: false)
        self.tabBar.tabBarBackgroundColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        self.tabBar.delegate = self
        self.view.addSubview(self.tabBar.view)
    
    }
    
    func tabBarController(_ tabBarController: BATabBarController, didSelect viewController: UIViewController) {
        print("Delegate success!")
        
        
        if let title = viewController.title{
            switch title {
            case "Announcements":
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    self.tabBar.tabBarBackgroundColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
                    self.statusBar.backgroundColor = .blue
                    self.tabBarItem2.tintColor = .blue
                    self.tabBarItem3.tintColor = .blue
                    //self.topBar.backgroundColor = UIColor.blue
                    //self.tabBar.tabBarItemStrokeColor = UIColor.white;
                    //self.topBarLabel.text = "Announcements"
                })
                break
            case "Schedule":
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    self.tabBar.tabBarBackgroundColor = UIColor(red:1.00, green:0.16, blue:0.10, alpha:1.00)
                    self.statusBar.backgroundColor = UIColor(red:0.57, green:0.07, blue:0.04, alpha:1.00)
                    self.tabBarItem1.tintColor = UIColor(red:0.57, green:0.07, blue:0.04, alpha:1.00)
                    self.tabBarItem3.tintColor = UIColor(red:0.57, green:0.07, blue:0.04, alpha:1.00)
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
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

