//
//  AnnouncementController.swift
//  hackGSU
//
//  Created by Viraj Shah on 9/24/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class announcementFeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var firebaseAnnouncements = [Announcement]()
    
    lazy var refresher: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .white
        refresh.backgroundColor = UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00)
        refresh.addTarget(self, action: #selector(refreshFeed), for: .valueChanged)

        return refresh
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarAttributes()
        checkIfUserIsLoggedIn()
        collectionView?.backgroundColor = UIColor(red:0.90, green:0.89, blue:0.90, alpha:1.00)
        collectionView?.register(AnnouncementCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.indicatorStyle = .black
        collectionView!.alwaysBounceVertical = true
        collectionView?.refreshControl = refresher
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        self.collectionView?.sendSubview(toBack: refresher)
//    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        refreshFeed()
    }
    
    func logOut(){
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        print("Signed out")
        
        let vc = LoginViewController()
        DispatchQueue.main.async(execute: { () -> Void in
            self.present(vc, animated: true, completion: nil)
        })
        
    }
    
    func refreshFeed(){
        firebaseAnnouncements.removeAll()
        observeAnnouncements()
        stopRefresher()
    }
    
    func observeAnnouncements(){
        let ref = FIRDatabase.database().reference().child("announcements")
        ref.observe(.childAdded, with: { (snapshot) in
            
            //print(snapshot)
            
            if let dictionary = snapshot.value as? [String: Any]{
                let announcement = Announcement()
                
                if let title = dictionary["Title"] as? String!{
                    announcement.Title = title
                    //print(title)
        
                }
                if let bodyText = dictionary["bodyText"] as? String!{
                    announcement.bodyText = bodyText
                    //print(bodyText)
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
                    self.collectionView?.reloadData()
                }
                
                
            }
            }, withCancel: nil)
        
    }
    
    func stopRefresher()
    {
        refresher.endRefreshing()
    }
    
    func checkIfUserIsLoggedIn(){
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(logOut), with: nil, afterDelay: 0)
        }
    }
    
    func setupNavBarAttributes(){
        navigationItem.title = "Announcements"
        //navigationController?.hidesBarsOnSwipe = true
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 24)!, NSForegroundColorAttributeName : UIColor.white]
        
        navigationController?.navigation
        Bar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(nil, for: .default)
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "More"), style: .plain, target: self, action: #selector(menuTap))
        moreButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = moreButton
        
        let plusButton = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addAnnouncement))
        plusButton.tintColor = .white
        navigationItem.rightBarButtonItem = plusButton
        
    }
    
    func addAnnouncement(){
        
        let newAnnouncementController = UINavigationController(rootViewController: NewAnnouncementController())
        present(newAnnouncementController, animated: true, completion: nil)
    
    }
    
    func menuTap(){
        logOut()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firebaseAnnouncements.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: "cellId", for: indexPath) as! AnnouncementCell
        
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
                        
            let rect = NSString(string: announcementTitle).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)], context: nil)
            
            let rectTitle = NSString(string: (firebaseAnnouncements[indexPath.item].bodyText)!).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)

            
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + rectTitle.height)
        }
        
        return CGSize(width: view.frame.width, height: 400)
    }
}
