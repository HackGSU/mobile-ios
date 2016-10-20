//
//  MapController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/13/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//


import UIKit
import Firebase

class MentorViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    
    override func viewDidLoad() {
        collectionView?.backgroundColor = .white
        setupNavBarAttributes()
        observeAnnouncements()
        setupCollectionView()
    }
    
    var firebaseRequests = [MentorRequest]()
    
    func observeAnnouncements(){
        
        let ref = FIRDatabase.database().reference().child("mentor_requests")
        ref.observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: Any]{
                
                let requests = MentorRequest()
                
                if let teamName = dictionary["teamName"] as? String!{
                    requests.name = teamName
                }
                if let timestamp = dictionary["timestamp"] as? NSNumber!{
                    requests.timestamp = timestamp
                }
                if let textdescription = dictionary["description"] as? String!{
                    requests.textdescription = textdescription
                }
                if let location = dictionary["location"] as? String!{
                    requests.location = location
                }
                if let category = dictionary["category"] as? String!{
                    requests.category = category
                }
                if let floor = dictionary["floor"] as? String!{
                    requests.floor = floor
                }
                if let status = dictionary["staus"] as? String!{
                    requests.status = status
                }
                if let title = dictionary["title"] as? String!{
                    requests.title = title
                }
                requests.uid = snapshot.key
                
                if (FIRAuth.auth()?.currentUser?.uid == snapshot.key){
                    self.firebaseRequests.append(requests)
                }
                
                self.firebaseRequests.sort(by: { (message1, message2) -> Bool in
                    
                    return (message1.timestamp?.intValue)! > (message2.timestamp?.intValue)!
                })
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
                
                
            }
            }, withCancel: nil)
    }

    
    
    func setupNavBarAttributes(){

        
        navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.barTintColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        navigationItem.title = "Request Help"
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 18)!, NSForegroundColorAttributeName : UIColor.white]
        navigationController!.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(menuTap))
        moreButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [moreButton]
        
        
    }
    
    func setupCollectionView(){
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.minimumLineSpacing = 5
            flowlayout.minimumInteritemSpacing = 5
        }
        
        collectionView?.register(MentorRequestCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 49, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 49, 0)
        
        collectionView?.backgroundColor = UIColor(red:0.90, green:0.89, blue:0.90, alpha:1.00)
    }
    
    
    
    
    func menuTap(){
        
        navigationController?.pushViewController(SendMentorRequestController(), animated: true)

        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firebaseRequests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let knownHeight: CGFloat = 35 + 40 + 40
        
        if let announcementTitle = firebaseRequests[indexPath.item].title {
            
            let rect = NSString(string: announcementTitle).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)], context: nil)
            
            let rectTitle = NSString(string: (firebaseRequests[indexPath.item].textdescription)!).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
            
            
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + rectTitle.height )
        }
        
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MentorRequestCell
        
        cell.mentorRequest = firebaseRequests[indexPath.item]
        cell.backgroundColor = .white
        return cell
        
    }
    
}
