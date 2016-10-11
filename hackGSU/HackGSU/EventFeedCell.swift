//
//  EventFeedCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/10/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase

class EventFeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    //    override func setupViews() {
    //        super.setupViews()
    //
    //    }
    
        var firebaseAnnouncements = [Announcement]()
        
        func observeAnnouncements(){
            
            let ref = FIRDatabase.database().reference().child("announcements")
            ref.observe(.childAdded, with: { (snapshot) in
                
                //print(snapshot)
                
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
                    
                    self.firebaseAnnouncements.append(announcement)
                    
                    self.firebaseAnnouncements.sort(by: { (message1, message2) -> Bool in
                        
                        return (message1.timestamp?.intValue)! > (message2.timestamp?.intValue)!
                    })
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                    
                }
                }, withCancel: nil)
        }
        
        
        lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.dataSource = self
            cv.delegate = self
            cv.translatesAutoresizingMaskIntoConstraints = false
            return cv
        }()
        
        let cellId = "cellId"
        
        override func setupViews(){
            super.setupViews()
            
            collectionView.register(AnnouncementCell.self, forCellWithReuseIdentifier: cellId)
            observeAnnouncements()
            addSubview(collectionView)
            
            collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            collectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return firebaseAnnouncements.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell( withReuseIdentifier: cellId, for: indexPath) as! AnnouncementCell
            
            cell.announcement = firebaseAnnouncements[(indexPath as NSIndexPath).item]
            cell.backgroundColor = .white
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let knownHeight: CGFloat = 35 + 40 + 40
            
            if let announcementTitle = firebaseAnnouncements[indexPath.item].Title {
                
                let rect = NSString(string: announcementTitle).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)], context: nil)
                
                let rectTitle = NSString(string: (firebaseAnnouncements[indexPath.item].bodyText)!).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
                
                
                return CGSize(width: frame.width, height: rect.height + knownHeight + rectTitle.height)
            }
            
            return CGSize(width: frame.width, height: 400)
        }
        
    }


