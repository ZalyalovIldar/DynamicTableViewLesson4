//
//  UserInfoViewController.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 11.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, SetStatusViewControllerDelegate {

    var status: String? {
        didSet {
            statusLabel.text = status
        }
    }
    
    @IBAction func setStatusButton(_ sender: UIButton) {
    }
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var infoAvatarImageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureUI() {
        scrollView.contentSize.height = 1000
        infoAvatarImageView.roundedImage()
        self.navigationItem.title = "Lorn"
    }
    
    func setStatus(with status: String) {
        self.status = status
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetStatusViewController" {
            let destinationVC = segue.destination as! SetStatusViewController
            destinationVC.delegate = self
        }
    
    }

}
