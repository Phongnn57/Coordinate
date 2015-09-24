//
//  ProfileViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/24/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var tableview: UITableView!
    var refreshControl: UIRefreshControl!
    
    private let CellIdentifier = "ProfileCell"
    
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
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    func initialize() {
        self.btnMenu.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
        self.tableview.registerNib(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        self.tableview.addSubview(self.refreshControl)
    }
    
    // MARK: DATA
    func refreshData() {
        self.refreshControl.endRefreshing()
        
    }
    
    // MARK: BUTTON ACTION
    
    @IBAction func didSelectEditButton(sender: AnyObject) {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.isEdit = true
        self.navigationController?.pushViewController(editProfileViewController, animated: true)
    }
    
    // MARK: TABLEVIEW
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! ProfileCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200 + SCREEN_SIZE.width  * 15/32
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }

}
