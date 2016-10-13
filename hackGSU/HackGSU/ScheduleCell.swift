//
//  scheduleCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/11/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class ScheduleCell: BaseCell{
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(timeLabel)
        addSubview(timeSeparator)
        addSubview(eventTitle)
        
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        timeSeparator.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8).isActive = true
        timeSeparator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        timeSeparator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.94).isActive = true
        timeSeparator.heightAnchor.constraint(equalToConstant: 6).isActive = true
        
        eventTitle.topAnchor.constraint(equalTo: timeSeparator.bottomAnchor, constant: 3).isActive = true
        eventTitle.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor).isActive = true
        eventTitle.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor).isActive = true
        
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.frame.width, height: UIViewNoIntrinsicMetric)
    }
    
    var event: Event?{
        didSet{
            eventTitle.text = event?.title
            
            if let seconds = (event?.timestamp?.doubleValue) {
                
                let jodaConvert = seconds/1000
                let timestampDate = NSDate(timeIntervalSince1970: jodaConvert)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"
                
                timeLabel.text = dateFormatter.string(from: timestampDate as Date)
            }
            
        }
    }
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.text = "6:00 PM"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        return label
    }()
    
    let timeSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemColor("darkRed")
        return view
    }()
    
    let eventTitle: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.font = UIFont.boldSystemFont(ofSize: 16)
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    
}
