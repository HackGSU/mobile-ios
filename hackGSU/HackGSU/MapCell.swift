//
//  MapCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/13/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class MapCell: BaseCell{
    
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
        
        
        addSubview(mapImageView)
        
        mapImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mapImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mapImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mapImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
    }
    
    
    
}
