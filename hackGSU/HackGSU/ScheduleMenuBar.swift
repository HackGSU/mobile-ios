//
//  MenuBar.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/6/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class ScheduleMenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let daysOfWeek = ["Friday", "Saturday", "Sunday"]
    let dates = ["21","22","23"]

    
    
    var ScheduleController: scheduleFeedController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemColor("red")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let dayContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemColor("red")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fridayLabel: UILabel = {
        let label = UILabel()
        label.text = "F"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let saturdayLabel: UILabel = {
        let label = UILabel()
        label.text = "S"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let sundayLabel: UILabel = {
        let label = UILabel()
        label.text = "S"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemColor("red")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Friday, October 21, 2016"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(ScheduleMenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(dayContainer)
        dayContainer.addSubview(fridayLabel)
        dayContainer.addSubview(saturdayLabel)
        dayContainer.addSubview(sundayLabel)
        addSubview(collectionView)
        addSubview(dateLabel)
        
        dayContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true

        dayContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        dayContainer.widthAnchor.constraint(equalToConstant: 225).isActive = true
        dayContainer.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        fridayLabel.leftAnchor.constraint(equalTo: dayContainer.leftAnchor).isActive = true
        fridayLabel.centerXAnchor.constraint(equalTo: dayContainer.centerXAnchor).isActive = true
        fridayLabel.widthAnchor.constraint(equalTo: dayContainer.widthAnchor, multiplier: 1/3).isActive = true
        fridayLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        saturdayLabel.centerYAnchor.constraint(equalTo: dayContainer.centerYAnchor).isActive = true
        saturdayLabel.centerXAnchor.constraint(equalTo: dayContainer.centerXAnchor).isActive = true
        saturdayLabel.widthAnchor.constraint(equalTo: dayContainer.widthAnchor, multiplier: 1/3).isActive = true
        saturdayLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        sundayLabel.rightAnchor.constraint(equalTo: dayContainer.rightAnchor).isActive = true
        sundayLabel.centerYAnchor.constraint(equalTo: dayContainer.centerYAnchor).isActive = true
        sundayLabel.widthAnchor.constraint(equalTo: dayContainer.widthAnchor, multiplier: 1/3).isActive = true
        sundayLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        collectionView.topAnchor.constraint(equalTo: dayContainer.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: dayContainer.leftAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 225).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -2).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: collectionView.leftAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: collectionView.widthAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        

        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScheduleMenuCell
        
        cell.dayText.text = dates[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        ScheduleController?.scrollToMenuIndex(indexPath.item)
        ScheduleController?.collectionView?.reloadData()
//        AnnouncementController?.scrollToMenuIndex(indexPath.item)
//        AnnouncementController?.collectionView?.reloadData()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
