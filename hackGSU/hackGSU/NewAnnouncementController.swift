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
    
    func setupNavBarAttributes() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        navigationItem.title = "Sponsors"
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 18)!, NSForegroundColorAttributeName : UIColor.white]
        navigationController!.navigationBar.tintColor = .white
    }
    
    func addAnnouncement(){
        
        if titleTextView.text.isEmpty || bodyTextView.text.isEmpty || topicTextView.text.isEmpty{
            print("Enter values")
            return
        }
        
        
        let ref = FIRDatabase.database().reference().child("announcements")
        let childRef = ref.childByAutoId()
        
        let fromId = FIRAuth.auth()!.currentUser!.uid
        let currentTime:Int = Int(NSDate().timeIntervalSince1970) * 1000
        
        
        let likes = getLikes()
        
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
                    
                    let values = ["title": TitleText, "bodyText": self.bodyTextView.text, "timestamp" : currentTime, "topic": self.topicTextView.text, "fromId" : fromId, "likes": likes] as [String : Any]
                    
                    childRef.updateChildValues(values)
                    print(fromId)
                    print(childRef.description())
                    
                self.navigationController!.popViewController(animated: true)

                
                }else{
                    print("Enter value for Title")
                    
                }
                
        })
        
    }

    func getLikes()-> Int {
        let random = Int(arc4random_uniform(50))
        return random
    }

    
    
    
}
