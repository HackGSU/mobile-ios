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
        return view
    }()
    
    let floorLabel: UILabel = {
       let label = UILabel()
       label.text = "Floor:"
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var floorTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.borderWidth = 0.5
        tv.layer.borderColor = UIColor.gray.cgColor
        tv.isEditable = true
        tv.textAlignment = .center
        tv.font = UIFont.systemFont(ofSize: 18)
        return tv
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
    
    lazy var menuPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = UIColor.white
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.showsSelectionIndicator = true
        return picker
    }()
    
    let menuPickerData = ["C", "0", "1", "2", "3"]
    
    lazy var doneButton: UIBarButtonItem = {
        var btn = UIBarButtonItem()
        btn = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        return btn
    }()
    
    let spaceButton: UIBarButtonItem = {
        var btn = UIBarButtonItem()
        btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        return btn
    }()
    
    lazy var cancelButton: UIBarButtonItem = {
        var btn = UIBarButtonItem()
        btn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        return btn
    }()
    
    func donePicker(){
        floorTextView.resignFirstResponder()
    }
    
    lazy var toolBar: UIToolbar = {
        let tb = UIToolbar()
        tb.barStyle = UIBarStyle.default
        tb.isTranslucent = true
        tb.tintColor = UIColor.gray
        tb.sizeToFit()
        tb.translatesAutoresizingMaskIntoConstraints = false
        
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        floorTextView.inputView = menuPicker
        floorTextView.inputAccessoryView = toolBar

        
        setupNavBarAttributes()
        setupViews()
    }
    func setupViews(){
        
        view.addSubview(teamNameLabel)
        view.addSubview(topicLabel)
        view.addSubview(floorContainer)
        floorContainer.addSubview(floorLabel)
        floorContainer.addSubview(floorTextView)
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

        
        floorLabel.leftAnchor.constraint(equalTo: floorContainer.leftAnchor, constant: 6).isActive = true
        floorLabel.topAnchor.constraint(equalTo: floorContainer.topAnchor, constant: 2).isActive = true
        floorLabel.widthAnchor.constraint(equalTo: floorContainer.widthAnchor, multiplier: 0.5, constant: 4).isActive = true
        floorLabel.heightAnchor.constraint(equalTo: floorContainer.heightAnchor, multiplier: 0.9).isActive = true
        
        floorTextView.rightAnchor.constraint(equalTo: floorContainer.rightAnchor, constant: -2).isActive = true
        floorTextView.topAnchor.constraint(equalTo: floorContainer.topAnchor).isActive = true
        floorTextView.widthAnchor.constraint(equalTo: floorContainer.widthAnchor, multiplier: 0.3).isActive = true
        floorTextView.heightAnchor.constraint(equalTo: floorContainer.heightAnchor, multiplier: 1).isActive = true
        
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
