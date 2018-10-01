//
//  ViewController.swift
//  TableViewLesson2
//
//  Created by Ильдар Залялов on 01/10/2018.
//  Copyright © 2018 Ильдар Залялов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var smallFactorConstraints: [NSLayoutConstraint]!
    
    var model: SomeObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = model.image
        textLabel.text = model.text
        
        imageViewTopConstraint.priority = .defaultLow
        
        smallFactorConstraints.forEach{ $0.isActive = true }
    }


}

