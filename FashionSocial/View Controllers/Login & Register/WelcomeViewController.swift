//
//  WelcomeViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/13/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initialize() {
        self.navigationController?.navigationBarHidden = true
    }
    
    @IBAction func gotoNextPage(sender: AnyObject) {
        let categoryViewController = CategoryViewController()
        categoryViewController.fromLogin = true
        self.navigationController?.pushViewController(categoryViewController, animated: true)
    }
    
}
