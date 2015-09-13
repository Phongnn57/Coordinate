//
//  LoginViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 8/29/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "hideKeyboard"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func hideKeyboard() {
        self.email.resignFirstResponder()
        self.password.resignFirstResponder()
    }
}
