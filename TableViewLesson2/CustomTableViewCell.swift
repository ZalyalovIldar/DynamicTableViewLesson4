//
//  CustomTableViewCell.swift
//  TableViewLesson2
//
//  Created by Ильдар Залялов on 01/10/2018.
//  Copyright © 2018 Ильдар Залялов. All rights reserved.
//

import UIKit

protocol CustomCellDelegate: class {
    func didPressInfoButton()
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var someImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: CustomCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(with image: UIImage, nameString: String, delegate: CustomCellDelegate) {
        
        someImageView.image = image
        nameLabel.text = nameString
        self.delegate = delegate
    }

    @IBAction func infoButtonPressed(_ sender: Any) {
        delegate?.didPressInfoButton()
    }
}
