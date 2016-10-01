//
//  LoginCell.swift
//  hackGSU
//
//  Created by Viraj Shah on 9/27/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//


import UIKit
import FirebaseDatabase
import FirebaseAuth

class LoginCell: UICollectionViewCell {
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "PHLogo")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    let anonIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "anon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let anonLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in as Anonymous"
        label.font = UIFont(name: "AmericanTypewriter", size: 18)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    lazy var anonContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAnonTap)))
        return view
    }()
    
    func handleAnonTap(){
        let vc:UIViewController = (self.window?.rootViewController)!
        
        anonContainerView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        self.anonContainerView.transform = CGAffineTransform.identity
            }, completion:  {
                (value: Bool) in
                
                FIRAuth.auth()?.signInAnonymously() { (user, error) in
                    
                    
                    if error != nil{
                        print (error)
                        return
                    }

                    guard let uid = user?.uid else {
                        return
                    }

                    let ref = FIRDatabase.database().reference(fromURL: "https://hackgsu-20b92.firebaseio.com/")
                    let usersReference = ref.child("user").child(uid)
                    let values = ["name":"anon", "email":"anon@gmail.com"]
                    usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                        if err != nil {
                            print(err)
                            return
                        }
                        
                        print("Saved user successfully into Firebase db")
                    })

                    
                    
                    
                    print("User logged in anonymously" + user!.uid)
                }
                
                vc.dismiss(animated: true, completion: nil)
        })
        
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logoImageView)
        addSubview(anonContainerView)
        
        anonContainerView.addSubview(anonIcon)
        anonContainerView.addSubview(anonLabel)
        
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -180, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 320, heightConstant: 60)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        _ = anonContainerView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 24, rightConstant: 16, widthConstant: 0, heightConstant: 70)
        
        anonIcon.centerYAnchor.constraint(equalTo: anonContainerView.centerYAnchor).isActive = true
        anonIcon.leftAnchor.constraint(equalTo: anonContainerView.leftAnchor).isActive = true
        anonIcon.widthAnchor.constraint(equalTo: anonContainerView.widthAnchor, multiplier: 0.2).isActive = true
        anonIcon.heightAnchor.constraint(equalTo: anonContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        
        anonLabel.leftAnchor.constraint(equalTo: anonIcon.rightAnchor, constant: 12).isActive = true
        anonLabel.centerYAnchor.constraint(equalTo: anonContainerView.centerYAnchor).isActive = true
        anonLabel.widthAnchor.constraint(equalTo: anonContainerView.widthAnchor, multiplier: 0.8).isActive = true
        anonLabel.heightAnchor.constraint(equalTo: anonContainerView.heightAnchor, multiplier: 0.8).isActive = true
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






