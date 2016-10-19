//
//  SendMentorRequestView.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/18/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class SendMentorRequestController: UIViewController{
    
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
        button.backgroundColor = UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00)
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
        view.addSubview(nameTextView)
        view.addSubview(LocationTextView)
        view.addSubview(bodyTextView)
        view.addSubview(submitButton)
        
        nameTextView.anchorWithConstantsToTop(topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 12)
        nameTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        LocationTextView.anchorWithConstantsToTop(nameTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 6, leftConstant: 12, bottomConstant: 0, rightConstant: 12)
        LocationTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        bodyTextView.anchorWithConstantsToTop(LocationTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 6, leftConstant: 12, bottomConstant: 0, rightConstant: 12)
        bodyTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        _ = submitButton.anchor(bodyTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 6, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 50)
        
    }
    
}
