//
//  AnnouncementCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 9/27/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class TeamCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profile_pic")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.masksToBounds = false
//        iv.layer.borderColor = UIColor.lightGray().CGColor
//        iv.layer.cornerRadius = image.frame.height/2

        iv.backgroundColor = .blue
        return iv
    }()
    
    
    func setupViews(){
        addSubview(profileImage)
        
        
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

