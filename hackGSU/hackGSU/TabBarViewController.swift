//
//  TabBarViewController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/08/16.
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
        let tabBarItem = BATabBarItem(image: UIImage(named: "alert_unselected")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "alert"))
        return tabBarItem!
    }()
    
    let tabBarItem2: BATabBarItem = {
        let tabBarItem = BATabBarItem(image: UIImage(named: "calendar_unselected")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "calendar"))
        tabBarItem?.tintColor = .blue
        
        return tabBarItem!
    }()
    let tabBarItem3: BATabBarItem = {
        let tabBarItem = BATabBarItem(image: UIImage(named: "map_unselected")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "map"))
        tabBarItem?.tintColor = .blue
        return tabBarItem!
    }()
        
    override func viewDidLayoutSubviews() {
        
        let vc1 = UINavigationController(rootViewController: announcementFeedController(collectionViewLayout: UICollectionViewFlowLayout()))
        vc1.title = "Announcements"
        
        
        let vc2 = UINavigationController(rootViewController: scheduleFeedController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //let vc2 = storyboard?.instantiateViewController(withIdentifier: "Schedule")
        vc2.title = "Schedule"
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "Maps")
        vc3?.title = "Maps"
        
        self.tabBar = BATabBarController()
        self.tabBar.tabBarItemStrokeColor = .white;
        self.tabBar.viewControllers = [vc1, vc2, vc3!]
        self.tabBar.tabBarItems = [tabBarItem1, tabBarItem2, tabBarItem3]
        self.tabBar.setSelectedView(vc1, animated: false)

        self.tabBar.tabBarBackgroundColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        self.tabBar.delegate = self
        self.view.addSubview(self.tabBar.view)
    
    }
    
    func tabBarController(_ tabBarController: BATabBarController, didSelect viewController: UIViewController) {
        
        if let title = viewController.title{
            switch title {
            case "Announcements":
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.colorTabBar("blue")
                })
                break
            case "Schedule":
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.colorTabBar("red")
                })
                break
            case "Maps":
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.colorTabBar("green")
                })
                break
            default:
                break
            }

        }
        
        }
    
    
    func colorTabBar(_ color: String){
        
        switch (color){
        case "blue":
            self.statusBar.backgroundColor = .blue
            self.tabBar.tabBarBackgroundColor = .systemColor("blue")
            self.tabBarItem1.tintColor = .white
            self.tabBarItem2.tintColor = .blue
            self.tabBarItem3.tintColor = .blue
            break;
        case "red":
            self.tabBar.tabBarBackgroundColor = .systemColor("red")
            self.statusBar.backgroundColor = .systemColor("darkRed")
            self.tabBarItem1.tintColor = .systemColor("darkRed")
            self.tabBarItem2.tintColor = .white
            self.tabBarItem3.tintColor = .systemColor("darkRed")
            break;
        case "green":
            self.tabBar.tabBarBackgroundColor = .systemColor("green")
            self.statusBar.backgroundColor = .systemColor("darkGreen")
            self.tabBarItem1.tintColor = .systemColor("darkGreen")
            self.tabBarItem2.tintColor = .systemColor("darkGreen")
            self.tabBarItem3.tintColor = .white
            break;
        default:
            break;
        }

    }
    
}

