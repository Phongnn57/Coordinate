//
//  SettingViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/13/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    private var SettingSwitchCellIdentifier = "SettingSwitchCell"
    private var SettingOnlyTextCellIdentifier = "SettingOnlyTextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func initialize() {
        self.title = "Cài đặt"
        self.tableview.registerNib(UINib(nibName: SettingSwitchCellIdentifier, bundle: nil), forCellReuseIdentifier: SettingSwitchCellIdentifier)
        self.tableview.registerNib(UINib(nibName: SettingOnlyTextCellIdentifier, bundle: nil), forCellReuseIdentifier: SettingOnlyTextCellIdentifier)
        self.navigationItem.leftBarButtonItem = self.menuButton()
    }
    
    // MARK: TABLEVIEW METHODS
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(SettingSwitchCellIdentifier) as! SettingSwitchCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(SettingOnlyTextCellIdentifier) as! SettingOnlyTextCell
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
            let alert = UIAlertView(title: "Đăng xuất", message: "Bạn có chắc muốn đăng xuất khỏi ứng dụng này?", delegate: self, cancelButtonTitle: "Đóng", otherButtonTitles: "Thoát")
            alert.tag = 1
            alert.show()
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
     // MARK: UIALERTVIEW
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 1 {
            if buttonIndex == 1 {
                DELEGATE.window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            } else {
                self.tableview.deselectRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0), animated: true)
            }
        }
    }

}
