//
//  FirebaseService.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/8/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FirebaseService: NSObject {

    
    static let sharedInstance = FirebaseService()
    
    func fetchAnnouncements(completion: @escaping ([Announcement])-> ()){
        let ref = FIRDatabase.database().reference().child("announcements")
        ref.observe(.childAdded, with: { (snapshot) in
            
            print(snapshot)
            
            
            var announcements = [Announcement]()
            
            if let dictionary = snapshot.value as? [String: Any]{
                
                let announcement = Announcement()
                
                if let title = dictionary["Title"] as? String!{
                    announcement.Title = title
                    
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
                
                
                announcements.append(announcement)
                
                announcements.sort(by: { (message1, message2) -> Bool in
                    
                    return (message1.timestamp?.intValue)! > (message2.timestamp?.intValue)!
                })
                
                DispatchQueue.main.async {
                    completion(announcements)
                }
                
                
            }
            }, withCancel: nil)

    }
}
