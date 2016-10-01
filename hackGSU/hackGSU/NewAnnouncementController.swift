//
//  NewAnnouncementView.swift
//  hackGSU
//
//  Created by Viraj Shah on 9/29/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase

extension NewAnnouncementController{
    
    func setupNavBarAttributes(){
        navigationItem.title = "Add Announcement"
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 24)!, NSForegroundColorAttributeName : UIColor.white]
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        let cancelButton = UIBarButtonItem(image: UIImage(named: "Delete"), style: .plain, target: self, action: #selector(dismissController))
        cancelButton.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButton
        
    }
    
    func dismissController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func addAnnouncement(){
        
        if titleTextView.text.isEmpty || bodyTextView.text.isEmpty || topicTextView.text.isEmpty{
            print("Enter values")
            return
        }
        
        
        let ref = FIRDatabase.database().reference().child("announcements")
        let childRef = ref.childByAutoId()
        
        let fromId = FIRAuth.auth()!.currentUser!.uid
        let currentTime:Int = Int(NSDate().timeIntervalSince1970)
        
        
        submitButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        self.submitButton.transform = CGAffineTransform.identity
            }, completion:  {
                (value: Bool) in
                
                if let TitleText = self.titleTextView.text{
                    
                    let values = ["Title": TitleText, "bodyText": self.bodyTextView.text, "timestamp" : currentTime, "topic": self.topicTextView.text, "fromId" : fromId] as [String : Any]
                    
                    childRef.updateChildValues(values)
                    print(fromId)
                    print(childRef.description())
                    self.dismiss(animated: true, completion: nil)
                }else{
                    print("Enter value for Title")
                    
                }
                
        })
        
    }

    

    
    
    
}
