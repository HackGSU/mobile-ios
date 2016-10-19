//
//  MentorRequestCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/19/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase

class MentorRequestCell: BaseCell {
    
    
    var ac = MentorViewController()
    
    
    var mentorRequest: MentorRequest?{
        didSet{
            
            mentorRequestTitle.text = mentorRequest?.title
            mentorRequestText.text = mentorRequest?.textdescription
            mentorRequestPoster.text = mentorRequest?.name
            timestamp.text = setupTime((mentorRequest?.timestamp?.intValue)!)
            topicLabel.text = mentorRequest?.category
            statusLabel.text = mentorRequest?.status
            }
    }
    
    var ref: FIRDatabaseReference!
    
    func setupTime(_ time: Int)->String {
        var currentTime = Int(NSDate().timeIntervalSince1970)
        
        let jodaConvert = time/1000
        
        currentTime = (currentTime - jodaConvert )/60
        
        if (currentTime == 1){
            return (currentTime.description + " minute ago • ")
        }
        if (currentTime >= 60){
            currentTime = currentTime/60
            if (currentTime == 1){
                return (currentTime.description + " hour ago • ")
            }else{
                return (currentTime.description + " hours ago • ")
            }
        }
        return (currentTime.description + " minutes ago • ")
        
        
    }
    
    let mentorRequestInfoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let timestamp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let mentorRequestPoster: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let mentorRequestTitle: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.font = UIFont.boldSystemFont(ofSize: 16)
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    let mentorRequestText: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.textColor = .gray
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    lazy var bottomButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    let buttonBottomSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.90, green:0.89, blue:0.90, alpha:1.00)
        return view
    }()
    
    let bottomSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 0.8, alpha:1)
        label.text = "GENERAL"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 9)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.frame.width, height: UIViewNoIntrinsicMetric)
    }
    
    override func setupViews(){
        addSubview(mentorRequestInfoContainer)
        addSubview(mentorRequestTitle)
        addSubview(mentorRequestText)
        addSubview(bottomButtonContainer)
        addSubview(buttonBottomSeparatorView)
        addSubview(bottomSeparatorView)
        addSubview(topicLabel)
        
        mentorRequestInfoContainer.addSubview(timestamp)
        mentorRequestInfoContainer.addSubview(mentorRequestPoster)
        
        //bottomButtonContainer.addSubview(statusLabel)
        
        mentorRequestInfoContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mentorRequestInfoContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mentorRequestInfoContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mentorRequestInfoContainer.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        timestamp.leftAnchor.constraint(equalTo: mentorRequestInfoContainer.leftAnchor, constant: 12).isActive = true
        timestamp.topAnchor.constraint(equalTo: mentorRequestInfoContainer.topAnchor, constant:6).isActive = true
        timestamp.widthAnchor.constraint(equalToConstant: 100)
        timestamp.heightAnchor.constraint(equalToConstant: 30)
        
        mentorRequestPoster.leftAnchor.constraint(equalTo: timestamp.rightAnchor).isActive = true
        mentorRequestPoster.centerYAnchor.constraint(equalTo: timestamp.centerYAnchor).isActive = true
        mentorRequestPoster.widthAnchor.constraint(equalToConstant: 150)
        mentorRequestPoster.heightAnchor.constraint(equalToConstant: 30)
        
        mentorRequestTitle.topAnchor.constraint(equalTo: mentorRequestInfoContainer.bottomAnchor, constant: -12).isActive = true
        mentorRequestTitle.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor).isActive = true
        mentorRequestTitle.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor).isActive = true
        
        topicLabel.topAnchor.constraint(equalTo: mentorRequestTitle.bottomAnchor, constant: -2).isActive = true
        topicLabel.leftAnchor.constraint(equalTo: mentorRequestTitle.leftAnchor, constant: 6).isActive = true
        topicLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        topicLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        //Announcement Body Text Constraints
        
        mentorRequestText.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: -4).isActive = true
        mentorRequestText.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor).isActive = true
        mentorRequestText.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor).isActive = true
        
        //Button Container Constraints
        
        bottomButtonContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomButtonContainer.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        
        buttonBottomSeparatorView.topAnchor.constraint(equalTo: mentorRequestInfoContainer.bottomAnchor, constant: -8).isActive = true
        buttonBottomSeparatorView.centerXAnchor.constraint(equalTo: bottomButtonContainer.centerXAnchor).isActive = true
        buttonBottomSeparatorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.94).isActive = true
        buttonBottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.4).isActive = true
        
        
        
        bottomSeparatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomSeparatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomSeparatorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
    }
    
    
}

