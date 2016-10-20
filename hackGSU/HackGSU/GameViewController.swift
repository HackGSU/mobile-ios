//
//  GameViewController.swift
//  hackGSU
//
//  Created by Viraj Shah on 10/19/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIWebViewDelegate {
    
    lazy var gameWebView: UIWebView = {
        let webV: UIWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 109))
        webV.loadRequest(URLRequest(url: URL(string: "https://randomuser999.github.io/pantherHack_Space_Invaders_Sponsors/")!))
        webV.delegate = self
        webV.scalesPageToFit = true
        return webV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(gameWebView)
        setupNavBarAttributes()
        setupViews()
        
    }
    
    func setupViews(){
        view.addSubview(gameWebView)
        gameWebView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        gameWebView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        gameWebView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        gameWebView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -49).isActive = true
        
    }
    
    func setupNavBarAttributes() {
        navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.barTintColor = UIColor(red:0.14, green:0.32, blue:0.95, alpha:1.00)
        navigationItem.title = "Sponsor Game"
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 18)!, NSForegroundColorAttributeName : UIColor.white]
        navigationController!.navigationBar.tintColor = .white
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Webview fail with error \(error)");
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Webview started Loading")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Webview did finish load")
        
        
    }
    
}
