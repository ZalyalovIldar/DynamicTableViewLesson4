//
//  UserFeedTableViewCell.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 09.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

class UserFeedTableViewCell: UITableViewCell {

    var activityViewController: UIActivityViewController?
    
    //https://stackoverflow.com/questions/30982754/presenting-uiactivityviewcontroller-initiating-from-inside-uitableviewcell
    weak var parentViewController = UIViewController()
    
    @IBAction func shareButton(_ sender: UIButton) {
        
        if mainTextLabel.text != nil {
            self.activityViewController = UIActivityViewController(activityItems: [mainTextLabel.text ?? ""], applicationActivities: nil)
            parentViewController?.present(self.activityViewController!, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var avatatImageVew: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var mainTextLabel: UILabel!
    
    @IBOutlet weak var imageViewDownConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        avatatImageVew.roundedImage()
    }

    
    func configureUI(with model: Feed) {
        
        if (model.text?.isEmpty)! {
            mainTextLabel.isHidden = true
            imageViewDownConstraint.priority = UILayoutPriority.defaultHigh
        }
  
        avatatImageVew.image = UIImage(named: model.image ?? "")
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        mainTextLabel.text = model.text
    }
    
    
}
