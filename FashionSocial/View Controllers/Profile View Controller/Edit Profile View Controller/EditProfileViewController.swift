//
//  EditProfileViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/13/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class EditProfileViewController: BaseViewController {
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var isEdit: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        if !self.isEdit {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.btnBack.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
            self.btnSave.hidden = true
        } else {
            self.btnSave.hidden = false
        }
    }
    
    func initialize() {
        
    }
    
    // MARK: BUTTON ACTION
    
    @IBAction func backButtonAction(sender: AnyObject) {
        if self.isEdit {
            let viewControllers = self.navigationController!.viewControllers
            let parentView = viewControllers[viewControllers.count - 2]
            self.navigationController?.popToViewController(parentView, animated: true)
        }
    }
    
    @IBAction func updateInfo(sender: AnyObject) {
    }
    

}
