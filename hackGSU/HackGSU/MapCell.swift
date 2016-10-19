//
//  MapCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/13/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class MapCell: BaseCell{
    
    
    let floorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .systemColor("green")
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()

    
    let mapImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "firstmap")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(floorLabel)
        addSubview(bottomSeparatorView)
        addSubview(mapImageView)
        
        
        floorLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        floorLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        floorLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        floorLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomSeparatorView.topAnchor.constraint(equalTo: floorLabel.bottomAnchor).isActive = true
        bottomSeparatorView.centerXAnchor.constraint(equalTo: floorLabel.centerXAnchor).isActive = true
        bottomSeparatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        mapImageView.topAnchor.constraint(equalTo: bottomSeparatorView.bottomAnchor).isActive = true
        mapImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mapImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mapImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -50).isActive = true
        
    }
    
    
    
}
