//
//  ProfileCell.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/24/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell() {
        self.avatar.sd_setImageWithURL(NSURL(string: UserObject.sharedUser.photoURL), placeholderImage: UIImage(named: "demo_avatar"))
    }
    
}
