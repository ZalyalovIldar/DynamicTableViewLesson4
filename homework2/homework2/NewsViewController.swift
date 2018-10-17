//
//  NewsViewController.swift
//  homework2
//
//  Created by itisioslab on 06.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    var news:News!
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageInNews: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func shareTextButton(_ sender: Any) {
        let text = "This is some text that I want to share."
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)

    }
    
}
