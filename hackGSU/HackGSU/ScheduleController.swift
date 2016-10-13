//
//  TempNameClass.swift
//  hackGSU
//
//  Created by saiharsha goli on 10/6/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import Foundation
import UIKit

class scheduleFeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    let cellId = "cellId"
    let saturdayCellId = "saturdayCellId"
    let sundayCellId = "sundayCellId"
    
    lazy var menuBar: ScheduleMenuBar = {
        let mb = ScheduleMenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.ScheduleController = self
        mb.backgroundColor = .systemColor("red")
        return mb
    }()
    
    func setupMenuBar(){
        
        view.addSubview(menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 80).isActive = true

    }
    
    override func viewDidLoad() {
        //name = "Schedule"
        
        setupNavBarAttributes()
        setupCollectionView()
        setupMenuBar()
    }
    
    func setupNavBarAttributes(){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = " Schedule"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemColor("red")
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuTap))
        moreButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [moreButton]
    }
    
    func scrollToMenuIndex(_ menuIndex: Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [] , animated: true)
        setDateForMenu(menuIndex)
        
    }
    
    func setDateForMenu(_ index: Int){
        switch (index){
        case 0:
            menuBar.dateLabel.text = "Friday, October 21, 2016"
        case 1:
            menuBar.dateLabel.text = "Saturday, October 22, 2016"
        case 2:
            menuBar.dateLabel.text = "Sunday, October 23, 2016"
        default: break
            
        }
    
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        setDateForMenu(Int(index))
        collectionView?.reloadData()
        
    }
    
    func setupCollectionView(){
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
            flowlayout.minimumLineSpacing = 0
        }
        
        collectionView?.register(EventFeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(SaturdayFeedCell.self, forCellWithReuseIdentifier: saturdayCellId)
        collectionView?.register(SundayFeedCell.self, forCellWithReuseIdentifier: sundayCellId)
        collectionView?.contentInset = UIEdgeInsetsMake(80, 0, 49, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(80, 0, 49, 0)
        collectionView?.backgroundColor = .systemColor("darkRed")
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    func menuTap(){
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: view.frame.width, height: view.frame.height - 129)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .white
            return cell

        }else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: saturdayCellId, for: indexPath)
            cell.backgroundColor = .white
            return cell

        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sundayCellId, for: indexPath)
            cell.backgroundColor = .white
            return cell
        }
        
        
        
        
    }
}
