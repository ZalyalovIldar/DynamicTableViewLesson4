//
//  CustomTableViewCell.swift
//  NewProject
//
//  Created by Гузель on 03.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var textOfPostLabel: UILabel!
    @IBOutlet weak var avatarOfGroupImageView: UIImageView!
    @IBOutlet weak var nameOfGroupLabel: UILabel!
    @IBOutlet weak var someImageView: UIImageView!
    weak var currentViewController: UIViewController!
    
    // MARK: - Методы -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Adding content and sharing -
    
    ///инициализация
    func addingContent(post:Post, controller:UIViewController){
        self.textOfPostLabel.text = post.description
        self.avatarOfGroupImageView.image = post.avatar
        self.nameOfGroupLabel.text = post.name
        self.someImageView.image = post.someImage
        currentViewController = controller
    }
    
    ///метод для шаринга с помощью UIActivityViewController
    @IBAction func shareAction(_ sender: Any) {
        var defaultMessage = "default"
        if textOfPostLabel.text != nil {
            defaultMessage = textOfPostLabel.text!
        }
        let activityController = UIActivityViewController(activityItems: [defaultMessage], applicationActivities: nil)
        currentViewController.present(activityController, animated: true, completion: nil)
    }
    
}
