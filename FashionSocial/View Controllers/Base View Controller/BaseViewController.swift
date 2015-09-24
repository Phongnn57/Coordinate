//
//  BaseViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 8/29/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func loadView() {
        let nameSpaceClassName = NSStringFromClass(self.classForCoder)
        let className = nameSpaceClassName.componentsSeparatedByString(".").last! as String
        NSBundle.mainBundle().loadNibNamed(className, owner:self, options:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func menuButton() -> UIBarButtonItem {
//        let btn = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: self.revealViewController(), action: "revealToggle:")
        
        let btn = UIButton(type: .Custom)
        btn.frame = CGRectMake(0, 0, 33, 22)
        btn.setImage(UIImage(named: "menu"), forState: UIControlState.Normal)
        btn.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
        let menuBtn = UIBarButtonItem(customView: btn)
        return menuBtn
    }

}
