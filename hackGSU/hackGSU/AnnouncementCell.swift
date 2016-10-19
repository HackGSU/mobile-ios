//
//  AnnouncementCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 9/27/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase

class AnnouncementCell: BaseCell {
    
    
    var uid: String?
    var likes: Int?
    
    var announcement: Announcement?{
        didSet{
            announcementText.text = announcement?.bodyText
            announcementTitle.text = announcement?.title
            //announcementPoster.text = announcement?.fromId
            topicLabel.text = announcement?.topic
            timestamp.text =  setupTime((announcement?.timestamp?.intValue)!)
            uid = announcement?.uid
            likes = announcement?.likes?.intValue
        }
    }
    
    var ref: FIRDatabaseReference!
    
    
    func setupLikes(_ likes: Int){
        if (likes > 1){
            self.button.setTitle(likes.description, for: .normal)
        }
    }
    
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
    
    let announcementInfoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "mores"), for: .normal)
        button.addTarget(self, action: #selector(handleMore), for: .touchUpInside)
        return button
    }()
    
    func handleMore(){
        print("more")
    }
    
    let timestamp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "14 minutes ago • "
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let announcementPoster: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@admin "
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let announcementTitle: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.font = UIFont.boldSystemFont(ofSize: 16)
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    let announcementText: UITextView = {
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
    
    lazy var likeButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleLikeButton)))
        return view
    }()
    lazy var shareButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleButton)))
        return view
    }()
    lazy var commentButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleButton)))
        return view
    }()
    let likeIcon: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "like")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .gray
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    let shareIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "share")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let commentIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "comment")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Like", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handleLikeButton), for: .touchUpInside)
        return button
    }()
    
    lazy var secondbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Comment", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    lazy var thirdbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    func handleLikeButton(){
        
        //button.setTitleColor(UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00), for: .normal)
        self.toggle()

        likeButtonContainer.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.8,
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        self.likeButtonContainer.transform = CGAffineTransform.identity
            }, completion:  {
                (value: Bool) in
                
        })
        
    }
    
    
    func toggleLike(_ increment: String){
        var newLike:Int
        
        switch (increment){
        case "Add":
            newLike = likes! + 1
        case "Minus":
            newLike = likes! - 1
        default:
            newLike = likes!
        }
        
        
        let ref = FIRDatabase.database().reference().child("announcements")
        
        ref.child(uid!).updateChildValues(["likes": newLike])
    }
    
    func toggle(){
        if likeIcon.tintColor == UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00){
            likeIcon.tintColor = .gray
            button.setTitleColor(.gray, for: .normal)
            toggleLike("Minus")
        }else{
            likeIcon.tintColor = UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00)
            button.setTitleColor(UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00), for: .normal)
            toggleLike("Add")
        }
    }
    
    func handleButton(){
        print(123)
    }
    
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
        addSubview(announcementInfoContainer)
        addSubview(announcementTitle)
        addSubview(announcementText)
        addSubview(bottomButtonContainer)
        addSubview(buttonBottomSeparatorView)
        addSubview(bottomSeparatorView)
        addSubview(topicLabel)

        announcementInfoContainer.addSubview(timestamp)
        announcementInfoContainer.addSubview(announcementPoster)
        announcementInfoContainer.addSubview(moreButton)
        
        bottomButtonContainer.addSubview(likeButtonContainer)
        bottomButtonContainer.addSubview(shareButtonContainer)
        
        likeButtonContainer.addSubview(likeIcon)
        likeButtonContainer.addSubview(button)
        
        shareButtonContainer.addSubview(shareIcon)
        shareButtonContainer.addSubview(thirdbutton)
        
        announcementInfoContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        announcementInfoContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        announcementInfoContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        announcementInfoContainer.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        timestamp.leftAnchor.constraint(equalTo: announcementInfoContainer.leftAnchor, constant: 12).isActive = true
        timestamp.topAnchor.constraint(equalTo: announcementInfoContainer.topAnchor, constant:6).isActive = true
        timestamp.widthAnchor.constraint(equalToConstant: 100)
        timestamp.heightAnchor.constraint(equalToConstant: 30)
        
        announcementPoster.leftAnchor.constraint(equalTo: timestamp.rightAnchor).isActive = true
        announcementPoster.centerYAnchor.constraint(equalTo: timestamp.centerYAnchor).isActive = true
        announcementPoster.widthAnchor.constraint(equalToConstant: 150)
        announcementPoster.heightAnchor.constraint(equalToConstant: 30)
        
        moreButton.rightAnchor.constraint(equalTo: announcementInfoContainer.rightAnchor, constant: -12).isActive = true
        moreButton.centerYAnchor.constraint(equalTo: announcementPoster.centerYAnchor).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 100)
        moreButton.heightAnchor.constraint(equalToConstant: 30)
        
        announcementTitle.topAnchor.constraint(equalTo: announcementInfoContainer.bottomAnchor, constant: -12).isActive = true
        announcementTitle.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor).isActive = true
        announcementTitle.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor).isActive = true

        topicLabel.topAnchor.constraint(equalTo: announcementTitle.bottomAnchor, constant: -2).isActive = true
        topicLabel.leftAnchor.constraint(equalTo: announcementTitle.leftAnchor, constant: 6).isActive = true
        topicLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        topicLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        //Announcement Body Text Constraints
        
        announcementText.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: -4).isActive = true
        announcementText.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor).isActive = true
        announcementText.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor).isActive = true
        
        //Button Container Constraints
        
        bottomButtonContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomButtonContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        buttonBottomSeparatorView.topAnchor.constraint(equalTo: announcementInfoContainer.bottomAnchor, constant: -8).isActive = true
        buttonBottomSeparatorView.centerXAnchor.constraint(equalTo: bottomButtonContainer.centerXAnchor).isActive = true
        buttonBottomSeparatorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.94).isActive = true
        buttonBottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.4).isActive = true
        
        likeButtonContainer.leftAnchor.constraint(equalTo: bottomButtonContainer.leftAnchor).isActive = true
        likeButtonContainer.centerYAnchor.constraint(equalTo: bottomButtonContainer.centerYAnchor).isActive = true
        likeButtonContainer.widthAnchor.constraint(equalTo: bottomButtonContainer.widthAnchor, multiplier: 0.5).isActive = true
        likeButtonContainer.heightAnchor.constraint(equalTo: bottomButtonContainer.heightAnchor, multiplier: 0.8).isActive = true
        
        button.centerXAnchor.constraint(equalTo: likeButtonContainer.centerXAnchor, constant: 8).isActive = true
        button.centerYAnchor.constraint(equalTo: likeButtonContainer.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: likeButtonContainer.widthAnchor, multiplier: 0.4).isActive = true
        button.heightAnchor.constraint(equalTo: likeButtonContainer.heightAnchor, multiplier: 0.9).isActive = true
        
        likeIcon.rightAnchor.constraint(equalTo: button.leftAnchor, constant: 16).isActive = true
        likeIcon.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: -1).isActive = true
        likeIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        likeIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        shareButtonContainer.leftAnchor.constraint(equalTo: likeButtonContainer.rightAnchor).isActive = true
        shareButtonContainer.centerYAnchor.constraint(equalTo: bottomButtonContainer.centerYAnchor).isActive = true
        shareButtonContainer.widthAnchor.constraint(equalTo: bottomButtonContainer.widthAnchor, multiplier: 0.5).isActive = true
        shareButtonContainer.heightAnchor.constraint(equalTo: bottomButtonContainer.heightAnchor, multiplier: 0.8).isActive = true
        
        thirdbutton.centerXAnchor.constraint(equalTo: shareButtonContainer.centerXAnchor, constant: 6).isActive = true
        thirdbutton.centerYAnchor.constraint(equalTo: shareButtonContainer.centerYAnchor).isActive = true
        thirdbutton.widthAnchor.constraint(equalTo: shareButtonContainer.widthAnchor, multiplier: 0.45).isActive = true
        thirdbutton.heightAnchor.constraint(equalTo: shareButtonContainer.heightAnchor, multiplier: 0.9).isActive = true
        
        shareIcon.rightAnchor.constraint(equalTo: thirdbutton.leftAnchor, constant: 14).isActive = true
        shareIcon.centerYAnchor.constraint(equalTo: thirdbutton.centerYAnchor, constant: -3).isActive = true
        shareIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        shareIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bottomSeparatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomSeparatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomSeparatorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
    }
    

}

