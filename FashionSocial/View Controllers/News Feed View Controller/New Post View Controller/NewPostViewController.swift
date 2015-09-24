//
//  NewPostViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/24/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class NewPostViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize() {
        
    }
    
    // MARK: BUTTON ACTION
    @IBAction func finishPost(sender: AnyObject) {
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

}
