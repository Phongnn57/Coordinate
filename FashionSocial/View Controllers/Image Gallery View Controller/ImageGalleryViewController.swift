//
//  ImageGalleryViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/24/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class ImageGalleryViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var btnBack: UIBarButtonItem!
    private let CellIdentifier = "ImageGalleryCell"
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initialize() {
        self.title = "Thư viện"
        self.navigationController?.navigationBarHidden = false
        let btn = UIButton(type: .Custom)
        btn.frame = CGRectMake(0, 0, 32, 36)
        btn.setImage(UIImage(named: "back_black"), forState: .Normal)
        btn.addTarget(self, action: "backToParentView", forControlEvents: UIControlEvents.TouchUpInside)
        self.btnBack = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = self.btnBack
        self.collectionview.registerNib(UINib(nibName: CellIdentifier, bundle: nil), forCellWithReuseIdentifier: CellIdentifier)
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: "refreshImage", forControlEvents: UIControlEvents.ValueChanged)
        self.collectionview.addSubview(self.refreshControl)
    }
    
    // MARK: DATA
    func refreshImage() {
        self.refreshControl.endRefreshing()
    }
    
    // MARK: BUTTON ACTION
    func backToParentView() {
        let viewControllers = self.navigationController!.viewControllers
        let parentView = viewControllers[viewControllers.count - 2]
        self.navigationController?.popToViewController(parentView, animated: true)
    }
    
    // MARK: COLLECTION VIEW
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifier, forIndexPath: indexPath) as! ImageGalleryCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = SCREEN_SIZE.width / 4
        return CGSizeMake(width, width)
    }

}
