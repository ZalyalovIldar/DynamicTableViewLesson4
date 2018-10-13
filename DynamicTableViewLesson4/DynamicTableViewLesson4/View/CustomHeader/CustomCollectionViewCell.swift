//
//  CustomCollectionViewCell.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 10.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureCell(with model: HeaderCollectionViewInfo) {
        countLabel.text = model.count
        descriptionLabel.text = model.description
    }
    
}
