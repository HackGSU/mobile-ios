//
//  ViewController.swift
//  hackGSU
//
//  Created by Harsha Goli on 9/24/16.
//  Copyright © 2016 hackGSU. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let imageNames = ["profilePic"]
    
    var teamMembers: [teamMember] = {
        var member1 = teamMember()
        member1.memberName = "Alex Mitchell"
        member1.groupName = "iOS Developer"
        member1.profileImageName = "alexPic"
        
        var member2 = teamMember()
        member2.memberName = "Viraj Shah"
        member2.groupName = "iOS Developer"
        member2.profileImageName = "virajPic"
        
        var member3 = teamMember()
        member3.memberName = "Harsha Goli"
        member3.groupName = "iOS Developer"
        member3.profileImageName = "harshaPic"
        
        var member4 = teamMember()
        member4.memberName = "Josh King"
        member4.groupName = "Android Developer"
        member4.profileImageName = "joshPic"
        
        var member5 = teamMember()
        member5.memberName = "Pranathi Venigandla"
        member5.groupName = "Android Developer"
        member5.profileImageName = "praPic"
        
        var member6 = teamMember()
        member6.memberName = "Solomon Arnett"
        member6.groupName = "Web Developer"
        member6.profileImageName = "soloPic"
        
        var member7 = teamMember()
        member7.memberName = "Sri Rajasekaran"
        member7.groupName = "Web Developer"
        member7.profileImageName = "sriPic"
        
        var member8 = teamMember()
        member8.memberName = "Abhinav Reddy"
        member8.groupName = "Web Developer"
        member8.profileImageName = "abhinavPic"
        
        
        return [member1,member2,member3,member4,member5,member6,member7,member8]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(teamMemberCell.self, forCellWithReuseIdentifier: cellId)
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.minimumLineSpacing = 0
            flowlayout.minimumInteritemSpacing = 0
        }
        
        collectionView?.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        layout.itemSize = CGSize(width: view.frame.width/3, height: view.frame.height/3)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        collectionView!.collectionViewLayout = layout
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 10, 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamMembers.count
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    let cellHeight:CGFloat = 100
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2, height: view.frame.height/3)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! teamMemberCell
        
       cell.profileImageView.image = UIImage(named: teamMembers[indexPath.item].profileImageName!)
        cell.nameTextLabel.text = teamMembers[indexPath.item].memberName!
        cell.teamTextLabel.text = teamMembers[indexPath.item].groupName!
        
        return cell
    }

}

