//
//  NewsFeedCell.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/24/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

protocol NewsFeedCellDelegate {
    func didSelectLikeAtIndexPath(indexpath: NSIndexPath)
    func didSelectCommentAtIndexPath(indexpath: NSIndexPath)
    func didSelectMoreAtIndexPath(indexpath: NSIndexPath)
}

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var mediaView: UIView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var mediaRatio: NSLayoutConstraint!
    var delegate: NewsFeedCellDelegate?
    var indexPath: NSIndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell() {
        self.avatar.sd_setImageWithURL(NSURL(string: UserObject.sharedUser.photoURL), placeholderImage: UIImage(named: "demo_avatar"))
    }
    
    func configCellWithNumberOfImage(imgNum: Int) {
        let tmpRect = self.mediaView.frame
        if imgNum == 1 {
            self.mediaView.frame = CGRectMake(tmpRect.origin.x, tmpRect.origin.y, SCREEN_SIZE.width, SCREEN_SIZE.width * 598 / 1200)
        } else if imgNum == 2 {
            self.mediaView.frame = CGRectMake(tmpRect.origin.x, tmpRect.origin.y, SCREEN_SIZE.width, SCREEN_SIZE.width)
        } else if imgNum == 3 {
            self.mediaView.frame = CGRectMake(tmpRect.origin.x, tmpRect.origin.y, SCREEN_SIZE.width, SCREEN_SIZE.width)
        } else if imgNum == 4 {
            self.mediaView.frame = CGRectMake(tmpRect.origin.x, tmpRect.origin.y, SCREEN_SIZE.width, SCREEN_SIZE.width)
        }
        self.layoutIfNeeded()
    }
    
    @IBAction func didSelectMore(sender: AnyObject) {
        self.delegate?.didSelectMoreAtIndexPath(self.indexPath)
    }
    @IBAction func didSelectComment(sender: AnyObject) {
        self.delegate?.didSelectCommentAtIndexPath(self.indexPath)
    }
    @IBAction func didSelectLike(sender: AnyObject) {
        self.delegate?.didSelectLikeAtIndexPath(self.indexPath)
    }
}
