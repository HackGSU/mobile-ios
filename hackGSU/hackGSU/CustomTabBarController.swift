//
//  CustomTabBarController.swift
//  hackGSU
//
//  Created by Viraj Shah on 9/23/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor.white
        
        let layout = UICollectionViewFlowLayout()
        let feedController = UINavigationController(rootViewController: announcementFeedController(collectionViewLayout: layout))
        
        feedController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "alert"), selectedImage: UIImage(named: "alert_filled-1"))
        //tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        feedController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        viewControllers = [feedController, createDummyNavControllerWithTitle("Calendar", imageName: "calendar", filled: "calendar_filled"), createDummyNavControllerWithTitle("Map", imageName: "map", filled: "map_filled"), createDummyNavControllerWithTitle("Request Mentor", imageName: "mentor", filled: "mentor_filled")]
        
        
    }
    
    fileprivate func createDummyNavControllerWithTitle(_ title: String, imageName: String, filled: String) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        //navController.tabBarItem.title = title
        navController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: imageName), selectedImage: UIImage(named: filled))
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        return navController
    }
    
}

