//
//  TechTipCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/17/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase

class TechTipCell : FeedCell{
    
    
    override func observeAnnouncements() {
        let ref = FIRDatabase.database().reference().child("announcements")
        ref.observe(.childAdded, with: { (snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: Any]{
                
                let announcement = Announcement()
                
                if let title = dictionary["title"] as? String!{
                    announcement.title = title
                    
                }
                if let bodyText = dictionary["bodyText"] as? String!{
                    announcement.bodyText = bodyText
                }
                if let timestamp = dictionary["timestamp"] as! NSNumber?{
                    announcement.timestamp = timestamp
                }
                if let topic = dictionary["topic"] as? String!{
                    announcement.topic = topic
                }
                if let fromId = dictionary["fromId"] as? String!{
                    announcement.fromId = fromId
                }
                if let likes = dictionary["likes"] as! NSNumber?{
                    announcement.likes = likes
                }
                announcement.uid = snapshot.key

                
                
                
                if let topic = dictionary["topic"] as! String?{
                    if (topic == "TECH"){
                        self.firebaseAnnouncements.append(announcement)
                    }
                }
                self.firebaseAnnouncements.sort(by: { (message1, message2) -> Bool in
                    
                    return (message1.timestamp?.intValue)! > (message2.timestamp?.intValue)!
                })

                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
            }
            }, withCancel: nil)
        
        
    }
}
