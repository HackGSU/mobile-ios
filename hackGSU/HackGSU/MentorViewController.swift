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
        
        let ref = FIRDatabase.database().reference().child("mentorRequests")
        ref.observe(.childAdded, with: { (snapshot) in
            
            print(snapshot)
            
            if let dictionary = snapshot.value as? [String: Any]{
                
                let requests = MentorRequest()
                
                if let name = dictionary["name"] as? String!{
                    requests.name = name
                }
                if let timestamp = dictionary["timestamp"] as? NSNumber!{
                    requests.timestamp = timestamp
                }
                if let bodyText = dictionary["bodyText"] as? String!{
                    requests.bodyText = bodyText
                }
                if let location = dictionary["location"] as? String!{
                    requests.location = location
                }
                
                self.firebaseRequests.append(requests)

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
        navigationController?.navigationBar.barTintColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
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
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
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
        return CGSize(width: view.frame.width, height: view.frame.height/2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        
        return cell
        
    }
    
}
