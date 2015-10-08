//
//  CommentViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 10/1/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class CommentViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    private let CellIdentifier = "CommentCell"
    private let HeaderIdentifier = "CommentHeaderView"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK
    func initialize() {
        self.tableview.registerNib(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        self.tableview.registerNib(UINib(nibName: HeaderIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderIdentifier)
    }
    
    // MARK: TABLEVIEW
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! CommentCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(HeaderIdentifier) as! CommentHeaderView
        
        return header
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}
