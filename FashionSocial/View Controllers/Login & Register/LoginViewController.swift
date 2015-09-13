//
//  LoginViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 8/29/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize() {
        self.btnLogin.layer.cornerRadius = (SCREEN_SIZE.width - 80) / 12
    }

}
