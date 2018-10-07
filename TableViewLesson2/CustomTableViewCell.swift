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
    
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var tvDate: UILabel!
    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var tvPostText: UILabel!
    @IBOutlet weak var ivPostImage: UIImageView!
    
    weak var delegate: CustomCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Метод вызывающийся при создания ячейки для её заполнения
    ///
    /// - Parameter post: объект класса Post из коллекции
    func configureCell(post: Post) {
        ivAvatar.image = post.authorAvatar
        tvDate.text = post.postDate
        tvName.text = post.authorName
        tvPostText.text = post.postText
        ivPostImage.image = post.postImage
        
        tvPostText.translatesAutoresizingMaskIntoConstraints = false
    }
}
