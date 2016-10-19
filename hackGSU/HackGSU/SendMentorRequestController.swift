//
//  SendMentorRequestController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/18/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

extension SendMentorRequestController{
    
    func setupNavBarAttributes() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Request Mentor"
        
        navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 18)!, NSForegroundColorAttributeName : UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }
    
    func addAnnouncement(){
        
        if (teamNameLabel.text?.isEmpty)! || (topicLabel.text?.isEmpty)! || (titleLabel.text?.isEmpty)! || bodyTextView.text.isEmpty{
            return
        }
        
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            return
        }
        
        let ref = FIRDatabase.database().reference().child("mentor_requests")
        let childRef = ref.child(uid)

        let currentTime:Int = Int(NSDate().timeIntervalSince1970) * 1000
        
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
                
                if let nameText = self.titleLabel.text{
                    
                    let values = ["name": nameText, "bodyText": self.bodyTextView.text, "timestamp" : currentTime, "location": self.LocationTextView.text] as [String : Any]
                    
                    childRef.updateChildValues(values)
                    
                    self.navigationController!.popViewController(animated: true)
                    
                    
                }else{
                    print("Enter value for Title")
                    
                }
                
        })
        
    }
    
    
    
}
