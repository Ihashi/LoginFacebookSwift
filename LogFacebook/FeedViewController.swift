//
//  FeedViewController.swift
//  LogFacebook
//
//  Created by ESIEA on 05/05/2015.
//  Copyright (c) 2015 HaiNguyen. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBAction func backButton() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
