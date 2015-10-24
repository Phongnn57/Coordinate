//
//  NewsFeedViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/24/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class NewsFeedViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, NewsFeedCellDelegate {

    @IBOutlet weak var tableview: UITableView!
    var refreshControl: UIRefreshControl!
    var btnNewPost: UIBarButtonItem!
    var btnSearch: UIBarButtonItem!
    var btnNotification: UIBarButtonItem!
    
    private var CellIdentifier = "NewsFeedCell"
    
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
        self.title = "Dòng thời gian"
        self.tableview.registerNib(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        self.tableview.addSubview(self.refreshControl)
        
        
        //
        let noti = UIButton(type: .Custom)
        noti.frame = CGRectMake(0, 0, 22, 22)
        noti.layer.cornerRadius = 11
        noti.clipsToBounds = true
        noti.backgroundColor = UIColor(rgba: "#00a3d9")
        noti.setTitle("2", forState: UIControlState.Normal)
        noti.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        noti.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.btnNotification = UIBarButtonItem(customView: noti)
        
        let btn = UIButton(type: .Custom)
        btn.frame = CGRectMake(0, 0, 30, 30)
        btn.setImage(UIImage(named: "new_post"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "goToNewPost", forControlEvents: UIControlEvents.TouchUpInside)
        self.btnNewPost = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItems = [self.btnNewPost, self.btnNotification]
        
        let search = UIButton(type: .Custom)
        search.frame = CGRectMake(0, 0, 40, 40)
        search.setImage(UIImage(named: "search"), forState: UIControlState.Normal)
        search.addTarget(self, action: "goTosearch", forControlEvents: UIControlEvents.TouchUpInside)
        self.btnSearch = UIBarButtonItem(customView: search)
        self.navigationItem.leftBarButtonItems = [self.menuButton(), self.btnSearch]
    }
    
    // MARK: DATA
    func refreshData() {
        self.refreshControl.endRefreshing()
    }
    
    // MARK: BUTTON ACTION
    func goToNewPost() {
        let newPostViewController = NewPostViewController()
        self.presentViewController(newPostViewController, animated: true) { () -> Void in
            
        }
    }
    
    func goTosearch() {
        
    }
    
    // MARK: TABLEVIEW
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! NewsFeedCell
//        cell.configCellWithNumberOfImage(indexPath.row + 1)
        cell.configCell()
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200 + SCREEN_SIZE.width  * 15/32
    }
    
    // Mark: Button action
    func didSelectLikeAtIndexPath(indexpath: NSIndexPath) {
        self.view.makeToast("You just select like the post at index: \(indexpath.row)")
    }
    
    func didSelectCommentAtIndexPath(indexpath: NSIndexPath) {
        self.view.makeToast("You just select comment button the post at index: \(indexpath.row)")
    }
    
    func didSelectMoreAtIndexPath(indexpath: NSIndexPath) {
        self.view.makeToast("You just select more button the post at index: \(indexpath.row)")
    }
    
    func didSelectPhotoAtIndexPath(indexpath: NSIndexPath) {
        self.view.makeToast("Photo selected")
    }

}
