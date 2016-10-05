//
//  AboutUsController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/5/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class AboutUsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView?.register(TeamCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupNavBarAttributes(){
        navigationItem.title = "Meet the Team"
        //navigationController?.hidesBarsOnSwipe = true
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 24)!, NSForegroundColorAttributeName : UIColor.white]
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red:0.07, green:0.45, blue:0.91, alpha:1.00)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(nil, for: .default)
    
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: cellId, for: indexPath) as! TeamCell
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        

        
        return CGSize(width: (view.frame.width), height: 100)
    }
}

