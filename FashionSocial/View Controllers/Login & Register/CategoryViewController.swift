//
//  CategoryViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/13/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var btnDone: UIBarButtonItem!
    
    var fromLogin: Bool = false
    private let CellIdentifier = "FavoriteCell"
    var categories = ["QUẦN ÁO NAM", "QUẦN ÁO NỮ", "VÍ DA NAM", "THẮT LƯNG NAM", "MŨ BẢO HIỂM", "SON MÔI"]
    
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
        if !self.fromLogin {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func initialize() {
        if !self.fromLogin {
            self.navigationItem.leftBarButtonItem = self.menuButton()
        } else {
            self.btnDone = UIBarButtonItem(title: "Xong", style: .Plain, target: self, action: "finishCategorySelection")
            self.navigationItem.rightBarButtonItem = self.btnDone
        }
        self.navigationController?.navigationBarHidden = false
        self.title = "Thiết lập chủ đề ưa thích"
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tableview.registerNib(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
    }
    
    // MARK: BUTTON ACTION
    func finishCategorySelection() {
        DELEGATE.startApp()
    }
    
    // MARK: TABLEVIEW METHODS
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! FavoriteCell
        cell.name.text = self.categories[indexPath.row]
        return cell
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

}
