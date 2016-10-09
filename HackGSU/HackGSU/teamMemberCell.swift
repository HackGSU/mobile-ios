//
//  teamMemberCell.swift
//  hackGSU
//
//  Created by Alexander Mitchell "MitchellOfficial" on 10/6/16.
//  Copyright © 2016 hackGSU. All rights reserved.
//

import UIKit


class teamMemberCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profilePic")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    
    let teamTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ios Developer"
        return label
    }()
    
    let nameTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alex Mitchell"
        return label
    }()
    
    
    func setupView() {
        backgroundColor = .yellow
        addSubview(profileImageView)
        addSubview(teamTextLabel)
        addSubview(nameTextLabel)
        
        //ios 9 constraints x,y, width , height
        
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -1).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        teamTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
