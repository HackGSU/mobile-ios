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

    let cellId = "cellId"
//    lazy var refresher: UIRefreshControl = {
//        let refresh = UIRefreshControl()
//        refresh.backgroundColor = UIColor(red:0.90, green:0.89, blue:0.90, alpha:1.00)
//        refresh.tintColor = UIColor(red:0.01, green:0.83, blue:0.84, alpha:1.00)
//            //UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
//        refresh.addTarget(self, action: #selector(refreshFeed), for: .valueChanged)
//
//        return refresh
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        setupNavBarAttributes()
        checkIfUserIsLoggedIn()
        setupMenuBar()
        setupCollectionView()
        //observeAnnouncements()
        //collectionView?.addSubview(refresher)
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.AnnouncementController = self
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    
    func setupMenuBar(){
        view.addSubview(menuBar)
        
        let blueview: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemColor("blue")
            return view
        }()
        
        view.addSubview(blueview)
        
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        blueview.topAnchor.constraint(equalTo: menuBar.topAnchor, constant: -20).isActive = true
        blueview.leftAnchor.constraint(equalTo: menuBar.leftAnchor).isActive = true
        blueview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        blueview.heightAnchor.constraint(equalToConstant: 30).isActive = true
        blueview.isUserInteractionEnabled = false
        
        menuBar.layer.zPosition = 1
        
    }
    
    func setupCollectionView(){
        
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
             flowlayout.scrollDirection = .horizontal
             flowlayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor(red:0.90, green:0.89, blue:0.90, alpha:1.00)
        //collectionView?.register(AnnouncementCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.indicatorStyle = .black
        collectionView!.alwaysBounceVertical = true
        collectionView?.isPagingEnabled = true
        collectionView?.contentInset = UIEdgeInsetsMake(100, 0, 99, 0)
        collectionView?.scrollIndicatorInsets  = UIEdgeInsetsMake(0, 0, 49, 0)

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
    
//    func refreshFeed(){
//        firebaseAnnouncements.removeAll()
//        observeAnnouncements()
//        stopRefresher()
//    }
    
    func observeAnnouncements(){
        
        
        FirebaseService.sharedInstance.fetchAnnouncements { (announcements: [Announcement]) in
            self.firebaseAnnouncements = announcements
            self.collectionView?.reloadData()
        }
//        let ref = FIRDatabase.database().reference().child("announcements")
//        ref.observe(.childAdded, with: { (snapshot) in
//            
//            print(snapshot)
//            
//            if let dictionary = snapshot.value as? [String: Any]{
//                
//                let announcement = Announcement()
//    
//                if let title = dictionary["Title"] as? String!{
//                    announcement.Title = title
//        
//                }
//                if let bodyText = dictionary["bodyText"] as? String!{
//                    announcement.bodyText = bodyText
//                }
//                if let timestamp = dictionary["timestamp"] as! NSNumber?{
//                    announcement.timestamp = timestamp
//                }
//                if let topic = dictionary["topic"] as? String!{
//                    announcement.topic = topic
//                }
//                if let fromId = dictionary["fromId"] as? String!{
//                    announcement.fromId = fromId
//                }
//                
//                
//                self.firebaseAnnouncements.append(announcement)
//
//                self.firebaseAnnouncements.sort(by: { (message1, message2) -> Bool in
//                        
//                        return (message1.timestamp?.intValue)! > (message2.timestamp?.intValue)!
//                    })
//                
//                DispatchQueue.main.async {
//                    self.collectionView?.reloadData()
//                }
//                
//                
//            }
//            }, withCancel: nil)
        
    }
    
//    func stopRefresher()
//    {
//        refresher.endRefreshing()
//    }
    
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
        
        //navigationController?.hidesBarsOnSwipe = true
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuTap))
        moreButton.tintColor = UIColor.white
        
//        let plusButton = UIBarButtonItem(image: UIImage(named: "Edit"), style: .plain, target: self, action: #selector(addAnnouncement))
//        plusButton.tintColor = .white
        navigationItem.rightBarButtonItems = [moreButton]
        
    }
    
    func addAnnouncement(){
        
        let newAnnouncementController = UINavigationController(rootViewController: NewAnnouncementController())
        present(newAnnouncementController, animated: true, completion: nil)
    
    }
    
    func menuTap(){
        //logOut()
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
    }
    
    func scrollToMenuIndex(_ menuIndex: Int){
        
        let indexPath = IndexPath(item: menuIndex, section: 0)
        
        collectionView?.scrollToItem(at: indexPath, at: [] , animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell( withReuseIdentifier: "cellId", for: indexPath) as! AnnouncementCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        //cell.announcement = firebaseAnnouncements[(indexPath as NSIndexPath).item]
        
//        let colors: [UIColor] = [.blue, .red, .green, .black]
//        
//        cell.backgroundColor = colors[indexPath.item]
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 99)
    }
}
