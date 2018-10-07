//
//  ShareViewController.swift
//  TableViewLesson2
//
//  Created by Тимур Бадретдинов on 07.10.2018.
//  Copyright © 2018 Ильдар Залялов. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var tvSharedText: UILabel!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///отображение теста для шэринга
        tvSharedText.text = post.postText
    }
}
