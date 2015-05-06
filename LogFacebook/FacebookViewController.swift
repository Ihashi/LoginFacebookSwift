//
//  ViewController.swift
//  LogFacebook
//
//  Created by ESIEA on 05/05/2015.
//  Copyright (c) 2015 HaiNguyen. All rights reserved.
//

import UIKit

class FacebookViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    private var currentAccessToken: String!
    @IBAction func exploreButton() {
        goToStoryStoryboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookLoginButton.delegate = self
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            currentAccessToken = self.returnFacebookAccessToken()
            println("\(currentAccessToken)")
            goToStoryStoryboard()
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil) {
            println("Error")
        }
        else if result.isCancelled {
            println("Cancel")
        }
        else {
            println("User Logged In")
            currentAccessToken = self.returnFacebookAccessToken()
            println("\(currentAccessToken)")
            goToStoryStoryboard()
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    func returnFacebookAccessToken() -> String {
        return FBSDKAccessToken.currentAccessToken().tokenString
    }
    
    func goToStoryStoryboard() {
        let storyStoryboard = UIStoryboard(name: "Story", bundle: nil)
        
        if let newController = storyStoryboard.instantiateViewControllerWithIdentifier("Feed View") as? FeedViewController {
            addChildViewController(newController)
            view.addSubview(newController.view)
            newController.didMoveToParentViewController(self)
        }
    }
}