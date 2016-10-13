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
    
        var events = [Event]()
    
    
        func observeAnnouncements(){
            
            let ref = FIRDatabase.database().reference().child("schedule")
            ref.observe(.childAdded, with: { (snapshot) in
                
                //print(snapshot)
                
                if let dictionary = snapshot.value as? [String: Any]{
                    
                    let event = Event()
                    
                    if let title = dictionary["title"] as? String!{
                        event.title = title
                    }
                    
                    if let timestamp = dictionary["timestamp"] as! NSNumber?{
                        event.timestamp = timestamp
                    }
                   
                   
                    if (event.timestamp!.doubleValue < 1477108800001){
                        self.events.append(event)
                    }
                    
                    self.events.sort(by: { (message1, message2) -> Bool in
                        
                        return (message2.timestamp?.decimalValue)! > (message1.timestamp?.decimalValue)!
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
            
            collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: cellId)
            observeAnnouncements()
            addSubview(collectionView)
            
            collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            collectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return events.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell( withReuseIdentifier: cellId, for: indexPath) as! ScheduleCell
            
//            cell.announcement = firebaseAnnouncements[(indexPath as NSIndexPath).item]
            
            
            
            cell.event = events[(indexPath as NSIndexPath).item]
            cell.backgroundColor = .white
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let knownHeight: CGFloat = 15 + 65
            
            if let eventTitle = events[indexPath.item].title {
                
                let rect = NSString(string: eventTitle).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)], context: nil)
                
                
                
                return CGSize(width: frame.width, height: rect.height + knownHeight)
            }
            
            return CGSize(width: frame.width, height: 400)
        }
        
    }

class SaturdayFeedCell: EventFeedCell{
    override func observeAnnouncements() {
        
        let ref = FIRDatabase.database().reference().child("schedule")
        ref.observe(.childAdded, with: { (snapshot) in
            
            //print(snapshot)
            
            if let dictionary = snapshot.value as? [String: Any]{
                
                let event = Event()
                
                if let title = dictionary["title"] as? String!{
                    event.title = title
                }
                
                if let timestamp = dictionary["timestamp"] as! NSNumber?{
                    event.timestamp = timestamp
                }
                
                
                if (event.timestamp!.doubleValue < 1477224000000){
                    if (event.timestamp!.doubleValue > 1477137599999){
                    self.events.append(event)
                    }}
                
                self.events.sort(by: { (message1, message2) -> Bool in
                    
                return (message2.timestamp?.decimalValue)! > (message1.timestamp?.decimalValue)!
                })
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
            }
            }, withCancel: nil)

    }
}

class SundayFeedCell: EventFeedCell{
    override func observeAnnouncements() {
        
        let ref = FIRDatabase.database().reference().child("schedule")
        ref.observe(.childAdded, with: { (snapshot) in
            
            //print(snapshot)
            
            if let dictionary = snapshot.value as? [String: Any]{
                
                let event = Event()
                
                if let title = dictionary["title"] as? String!{
                    event.title = title
                }
                
                if let timestamp = dictionary["timestamp"] as! NSNumber?{
                    event.timestamp = timestamp
                }
                
                
                if (event.timestamp!.doubleValue > 1477223999999){
                        self.events.append(event)
                }
                
                self.events.sort(by: { (message1, message2) -> Bool in
                    
                    return (message2.timestamp?.decimalValue)! > (message1.timestamp?.decimalValue)!
                })
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
            }
            }, withCancel: nil)
        
    }
}


