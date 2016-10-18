//
//  AnnouncementController.swift
//  hackGSU
//
//  Created by Viraj Shah on 9/24/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import FirebaseAuth

class announcementFeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let trendingCellId = "trendingCellId"
    let foodCellId = "foodCellId"
    let techCellId = "techCellId"
    
    let titles = ["Announcements", "Trending", "Food Alerts", "Tech Tips"]

    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.AnnouncementController = self
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfUserIsLoggedIn()
        setupNavBarAttributes()
        setupMenuBar()
        setupCollectionView()
    }
    override func viewDidAppear(_ animated: Bool) {
        collectionView?.reloadData()
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
        
        //navigationController?.hidesBarsOnSwipe = true
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
    
    func setupMenuBar(){
            let blueview: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemColor("blue")
            return view
        }()
        
        view.addSubview(menuBar)
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
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
        
        collectionView?.register(FoodCell.self, forCellWithReuseIdentifier: foodCellId)
        collectionView?.register(TechTipCell.self, forCellWithReuseIdentifier: techCellId)
        
        collectionView?.indicatorStyle = .black
        collectionView?.isPagingEnabled = true
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 49, 0)
        collectionView?.scrollIndicatorInsets  = UIEdgeInsetsMake(50, 0, 49, 0)
        collectionView?.showsHorizontalScrollIndicator = false

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
            
            self.navigationController?.pushViewController(vc, animated: true)
            //self.present(vc, animated: true, completion: nil)
        })
        
    }
    
    func showViewControllerForSetting(_ setting: Setting){
        let name = setting.name
        
        switch (name){
            case "Sponsors":
            navigationController?.pushViewController(Sponsor(), animated: true)
            case "Code of Conduct":
            navigationController?.pushViewController(CodeOfConductViewController(), animated: true)
            case "Send Feedback":
        navigationController?.pushViewController(SendFeedbackController(), animated: true)
        default:
            return
        }
    }
    
//    
//    let settings: [Setting] = {
//        return [Setting(name: "About Us", imageName: "about"), Setting(name: "Sponsors", imageName: "sponsor"), Setting(name: "Check out the Prizes", imageName: "prize"), Setting(name: "Request a mentor", imageName: "help"), Setting(name: "Send Feedback", imageName: "feedback"), Setting(name: "Code of Conduct", imageName: "privacy")]
//    }()
    
    
    func addAnnouncement(){
//        let newAnnouncementController = UINavigationController(rootViewController: NewAnnouncementController())
//        present(newAnnouncementController, animated: true, completion: nil)
        //navigationController?.pushViewController(Sponsor(), animated: true)
        //navigationController?.pushViewController(CodeOfConductViewController(), animated: true)
        
        navigationController?.pushViewController(NewAnnouncementController(), animated: true)
        
        //navigationController?.pushViewController(SendFeedbackController(), animated: true)
        
    }
    
    lazy var menuLauncher: announcementMenuLauncher = {
        let launcher = announcementMenuLauncher()
        launcher.announcementController = self
        return launcher
    }()
    
    
    func menuTap(){
        menuLauncher.showSettings()
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
        setTitleForIndex(Int(index))
        collectionView?.reloadData()
        
    }
    
    func scrollToMenuIndex(_ menuIndex: Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [] , animated: true)
        
        setTitleForIndex(menuIndex)
    }
    
    private func setTitleForIndex(_ index: Int){
        if let titleLabel = navigationItem.titleView as? UILabel{
            titleLabel.text = " \(titles[index])"
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.item
        switch (index){
        case 0:
            return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellId, for: indexPath)
        case 2:
            return collectionView.dequeueReusableCell(withReuseIdentifier: foodCellId, for: indexPath)
        case 3:
            return collectionView.dequeueReusableCell(withReuseIdentifier: techCellId, for: indexPath)
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //tabBar height = 49 + menuBar = 50
        return CGSize(width: view.frame.width, height: view.frame.height - 99)
    }
}
