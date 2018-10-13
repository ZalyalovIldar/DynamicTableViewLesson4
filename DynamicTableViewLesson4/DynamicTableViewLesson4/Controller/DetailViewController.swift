//
//  DetailViewController.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 13.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailText: UILabel!
    
    var detail: String?
    var subtitle: String?
    var detailImage: UIImageView?
    var detailMainText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.roundedImage()
        scrollView.contentSize.height = 1000
        
        detailLabel.text = detail
        subtitleLabel.text = subtitle
        detailImageView.image = detailImage?.image
        detailText.text = detailMainText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
