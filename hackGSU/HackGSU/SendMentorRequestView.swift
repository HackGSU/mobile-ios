//
//  SendMentorRequestView.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/18/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class SendMentorRequestController: UIViewController{
    
    
    let teamNameLabel: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        tf.placeholder = "Team Name"
        tf.textAlignment = .center
        return tf
    }()
    
    let topicLabel: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        tf.placeholder = "Topic"
        tf.textAlignment = .center
        return tf
    }()
    
    let floorContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let locationLabel: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        tf.placeholder = "Location"
        tf.textAlignment = .center
        return tf
    }()
    
    let titleLabel: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        tf.placeholder = "What's Your Problem?"
        tf.textAlignment = .center
        return tf
    }()
    
    lazy var nameTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.borderWidth = 0.5
        tv.layer.borderColor = UIColor.gray.cgColor
        tv.isEditable = true
        tv.font = UIFont.systemFont(ofSize: 18)
        return tv
    }()
    
    lazy var bodyTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.borderWidth = 0.5
        tv.layer.borderColor = UIColor.gray.cgColor
        tv.isEditable = true
        tv.font = UIFont.systemFont(ofSize: 18)
        return tv
    }()
    
    lazy var LocationTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.borderWidth = 0.5
        tv.layer.borderColor = UIColor.gray.cgColor
        tv.isEditable = true
        tv.font = UIFont.systemFont(ofSize: 18)
        return tv
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(white: 0.8, alpha: 1)
        button.setTitle("Send Mentor Request", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(addAnnouncement), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        
        setupNavBarAttributes()
        setupViews()
    }
    func setupViews(){
        
        view.addSubview(teamNameLabel)
        view.addSubview(topicLabel)
        view.addSubview(floorContainer)
        view.addSubview(locationLabel)
        view.addSubview(titleLabel)
        view.addSubview(bodyTextView)
        view.addSubview(submitButton)
        
        teamNameLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 12).isActive = true
        teamNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6).isActive = true
        teamNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -12).isActive = true
        teamNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        topicLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 12).isActive = true
        topicLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -6).isActive = true
        topicLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -12).isActive = true
        topicLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        floorContainer.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 12).isActive = true
        floorContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6).isActive = true
        floorContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -12).isActive = true
        floorContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 12).isActive = true
        locationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -6).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -12).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.anchorWithConstantsToTop(floorContainer.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 12, leftConstant: 6, bottomConstant: 0, rightConstant: 6)
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        bodyTextView.anchorWithConstantsToTop(titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 6, leftConstant: 6, bottomConstant: 0, rightConstant: 6)
        bodyTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        submitButton.anchorWithConstantsToTop(bodyTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 6, leftConstant: 6, bottomConstant: 0, rightConstant: 6)
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
}
