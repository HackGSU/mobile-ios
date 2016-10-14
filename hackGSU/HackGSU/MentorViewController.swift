//
//  MentorViewController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/13/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class MentorViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarAttributes()
    }
    
    func setupNavBarAttributes(){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = " Request Mentor"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemColor("green")
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addRequest))
        moreButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [moreButton]
        
        
    }
    
    func addRequest(){

    }
    
    func setupCollectionView(){
        collectionView?.backgroundColor = .white
    }
    
    
    
}
