//
//  CustomHeaderFeedTableViewCell.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 13.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

class CustomHeaderFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var headerAvatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerAvatarImageView.roundedImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
