//
//  InfoPostViewController.swift
//  ProjectAlexCourse2
//
//  Created by Александр Арсенюк on 03.10.2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

import UIKit



class InfoPostViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var image: UIImageView!
    var test1: Post?
    var s = DataManager ()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        text.text = test1?.name
        image.image = test1?.post
    }
    

}
