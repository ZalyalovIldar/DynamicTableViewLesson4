//
//  SetStatusViewController.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 12.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

protocol SetStatusViewControllerDelegate {
    func setStatus(with status: String)
}

class SetStatusViewController: UIViewController {

    var delegate: SetStatusViewControllerDelegate?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        let addButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItemStyle.done, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = addButton
    }

    @objc func tapButton() {
        let status = textView.text ?? ""
        delegate?.setStatus(with: status)
        navigationController?.popViewController(animated: true)
    }
}
