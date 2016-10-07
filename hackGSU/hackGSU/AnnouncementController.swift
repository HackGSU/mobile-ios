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

class announcementFeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var firebaseAnnouncements = [Announcement]()

    
    lazy var refresher: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .white
        refresh.backgroundColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        refresh.addTarget(self, action: #selector(refreshFeed), for: .valueChanged)

        return refresh
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restorationIdentifier = "Announcments"
        view.backgroundColor = .white
        setupNavBarAttributes()
        checkIfUserIsLoggedIn()
        setupMenuBar()
        setupCollectionView()
        observeAnnouncements()
        collectionView?.addSubview(refresher)
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    
    func setupMenuBar(){
        view.addSubview(menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupCollectionView(){
        collectionView?.backgroundColor = UIColor(red:0.90, green:0.89, blue:0.90, alpha:1.00)
        collectionView?.register(AnnouncementCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.indicatorStyle = .black
        collectionView!.alwaysBounceVertical = true
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets  = UIEdgeInsetsMake(50, 0, 0, 0)

    }
    
//    let statusBar: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//
//    
//    func setupStatusBar(){
//        
//        let window = UIApplication.shared.keyWindow!
//
//        
//        window.addSubview(statusBar)
//        
//        //UIApplication.shared.keyWindow?.addSubview(statusBar)
//        
//        statusBar.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
//        statusBar.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
//        statusBar.widthAnchor.constraint(equalTo: window.widthAnchor).isActive = true
//        statusBar.heightAnchor.constraint(equalToConstant: 20).isActive = true
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.collectionView?.sendSubview(toBack: refresher)
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
            
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        
        titleLabel.text = " Announcements"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel        
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuTap))
        moreButton.tintColor = UIColor.white
        
        let plusButton = UIBarButtonItem(image: UIImage(named: "Edit"), style: .plain, target: self, action: #selector(addAnnouncement))
        plusButton.tintColor = .white
        navigationItem.rightBarButtonItems = [moreButton, plusButton]
        
    }
    
    func addAnnouncement(){
        
        let newAnnouncementController = UINavigationController(rootViewController: NewAnnouncementController())
        present(newAnnouncementController, animated: true, completion: nil)
    
    }
    
    func menuTap(){
        //logOut()
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
