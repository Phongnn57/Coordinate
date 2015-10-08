//
//  TopMenuCell.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 9/13/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class TopMenuCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
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
    
}
