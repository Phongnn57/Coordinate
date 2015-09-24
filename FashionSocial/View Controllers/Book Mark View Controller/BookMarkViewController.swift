//
//  BookMarkViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/24/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class BookMarkViewController: BaseViewController {
    
    var btnMore: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    func initialize() {
        self.title = "Dấu trang"
        
        let btn = UIButton(type: .Custom)
        btn.frame = CGRectMake(0, 0, 60, 40)
        btn.setImage(UIImage(named: "more_bookmark"), forState: UIControlState.Normal)
        self.btnMore = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = self.btnMore
        self.navigationItem.leftBarButtonItem = self.menuButton()
    }

}
