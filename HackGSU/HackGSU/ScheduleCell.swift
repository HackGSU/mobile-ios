//
//  ScheduleCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/2/16.
//  Copyright © 2016 hackGSU. All rights reserved.
//

import UIKit

class ScheduleTableCell: UITableViewCell{
    
    
    let timeContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2:00 PM"
        return label
    }()
    
    let eventTitle: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "New Announcement"
        tv.font = UIFont.boldSystemFont(ofSize: 16)
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    let eventText: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "The event will take place in this location"
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    
    
    let timeColorContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    

    
    let timeWidth:CGFloat = 100
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: (self.frame.width - timeWidth), height: UIViewNoIntrinsicMetric)
    }
    
    func setupViews(){
        addSubview(timeContainer)
        addSubview(eventTitle)
        addSubview(eventText)
        timeContainer.addSubview(timeLabel)

        
        
        timeContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        timeContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        //timeContainer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        timeContainer.widthAnchor.constraint(equalToConstant: timeWidth)
        timeContainer.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        timeLabel.leftAnchor.constraint(equalTo: timeContainer.leftAnchor, constant: 8).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: timeContainer.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: timeContainer.widthAnchor, multiplier: 0.8).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: timeContainer.heightAnchor).isActive = true
        
//        eventTitle.leftAnchor.constraint(equalTo: timeContainer.leftAnchor).isActive = true
//        eventTitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        eventTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        eventTitle.leftAnchor.constraint(equalTo: timeContainer.rightAnchor).isActive = true
        eventTitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        eventTitle.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
//        eventText.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        eventText.leftAnchor.constraint(equalTo: eventTitle.leftAnchor).isActive = true
        eventText.topAnchor.constraint(equalTo: eventTitle.bottomAnchor).isActive = true
        eventText.leftAnchor.constraint(equalTo: timeContainer.rightAnchor).isActive = true
        eventText.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        eventText.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true



        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
