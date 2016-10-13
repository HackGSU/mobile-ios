//
//  announcementMenuCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/12/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//


import UIKit

class announcementMenuCell: BaseCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .lightGray
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(textLabel)
        
        
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        textLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 12).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -28).isActive = true
        textLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    
}
