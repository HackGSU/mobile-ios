//
//  AboutViewController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/19/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class AboutViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
        member2.profileImageName = "vrPic"
        
        var member3 = teamMember()
        member3.memberName = "Harsha Goli"
        member3.groupName = "iOS Developer"
        member3.profileImageName = "harshaPic"
        
        var member4 = teamMember()
        member4.memberName = "Dylan Welch"
        member4.groupName = "iOS Developer"
        member4.profileImageName = "dylanPic"
        
        var member5 = teamMember()
        member5.memberName = "Josh King"
        member5.groupName = "Android Developer"
        member5.profileImageName = "joshPic"
        
        var member6 = teamMember()
        member6.memberName = "Pranathi Venigandla"
        member6.groupName = "Android Developer"
        member6.profileImageName = "praPic"
        
        var member7 = teamMember()
        member7.memberName = "Solomon Arnett"
        member7.groupName = "Web Developer"
        member7.profileImageName = "soloPic"
        
        var member8 = teamMember()
        member8.memberName = "Sri Rajasekaran"
        member8.groupName = "Web Developer"
        member8.profileImageName = "sriPic"
        
        var member9 = teamMember()
        member9.memberName = "Abhinav Reddy"
        member9.groupName = "Web Developer"
        member9.profileImageName = "abhinavPic"
        
        
        
        
        return [member1,member2,member3,member4,member5,member6,member7,member8,member9]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "About Us"
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 18)!, NSForegroundColorAttributeName : UIColor.white]
        navigationController!.navigationBar.tintColor = .white

        collectionView?.register(teamMemberCell.self, forCellWithReuseIdentifier: cellId)
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.minimumLineSpacing = 0
            flowlayout.minimumInteritemSpacing = 0
        }
        
        collectionView?.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
        
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
