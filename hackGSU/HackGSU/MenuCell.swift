//
//  MenuCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/6/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class MenuCell: BaseCell{
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .blue
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = isHighlighted ? .white : .blue
        }
    }
    
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? .white : .blue
        }
    }
    
    
    override func setupViews(){
        super.setupViews()
        
        addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
