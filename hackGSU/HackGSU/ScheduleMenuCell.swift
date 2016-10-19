//
//  ScheduleMenuCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/9/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class ScheduleMenuCell: BaseCell{
    
    let dayText: UILabel = {
        let label = UILabel()
        label.text = "21"
        label.textColor = .systemColor("darkRed")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemColor("red")
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemColor("red").cgColor
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    override var isHighlighted: Bool{
        didSet{
            dayText.textColor = isHighlighted ? .systemColor("red") : .systemColor("darkRed")
            dayText.backgroundColor = isHighlighted ? .white : .systemColor("red")
        }
    }
    
    override var isSelected: Bool{
        didSet{
            dayText.textColor = isSelected ? .systemColor("red") : .systemColor("darkRed")
            dayText.backgroundColor = isSelected ? .white : .systemColor("red")

        }
    }
    
    
    override func setupViews() {
        
        addSubview(dayText)
        
        dayText.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dayText.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dayText.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
