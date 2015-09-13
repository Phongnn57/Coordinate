//
//  NotificationViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/13/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var refreshControl: UIRefreshControl!
    
    private let CellIdentifier = "NotificationCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize() {
        self.tableview.registerNib(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        self.tableview.addSubview(self.refreshControl)
    }
    
    // MARK: DATA
    func refreshData() {
        self.refreshControl.endRefreshing()
    }
    
    // MARK: TABLEVIEW METHODS
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! NotificationCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

}
