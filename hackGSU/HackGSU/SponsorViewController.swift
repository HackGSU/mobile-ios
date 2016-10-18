//
//  SponsorViewController.swift
//  hackGSU
//
//  Created by saiharsha goli on 10/17/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import Foundation
import UIKit

class Sponsor: UIViewController {
    
    let sponsorImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Sponsors")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarAttributes()
        setupViews()
        
    }
    
    func setupViews(){
        view.addSubview(sponsorImageView)
        sponsorImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        sponsorImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sponsorImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        sponsorImageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -49).isActive = true
        
    }
    
    func setupNavBarAttributes() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        navigationItem.title = "Sponsors"
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 18)!, NSForegroundColorAttributeName : UIColor.white]
        navigationController!.navigationBar.tintColor = .white
    }
    
}
