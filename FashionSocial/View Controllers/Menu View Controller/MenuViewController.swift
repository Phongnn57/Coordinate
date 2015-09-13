//
//  MenuViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/13/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    private let CellIdentifier = "MenuCell"
    private let TopCellIdentifier = "TopMenuCell"
    private let images = ["notification", "news", "bookmark", "list", "profile", "setting"]
    private let titles = ["THÔNG BÁO", "DÒNG THỜI GIAN", "ĐÁNH DẤU", "CÁC CHUYÊN MỤC", "THÔNG TIN CÁ NHÂN", "CÀI ĐẶT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize() {
        self.tableview.registerNib(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        self.tableview.registerNib(UINib(nibName: TopCellIdentifier, bundle: nil), forCellReuseIdentifier: TopCellIdentifier)
    }
    
    // MARK: TABLEVIEW METHODS
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(TopCellIdentifier) as! TopMenuCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! MenuCell
            
            cell.avatar.image = UIImage(named: self.images[indexPath.row])
            cell.title.text = self.titles[indexPath.row]
            
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {return 60}
        return 44
    }


}
