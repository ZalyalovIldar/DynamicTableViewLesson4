//
//  PostTableViewCell.swift
//  ProjectAlexCourse2
//
//  Created by Александр Арсенюк on 03.10.2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

import UIKit
import SpriteKit
protocol CustomCellDelegate: class {
    func didpressbutton()
    func share()
}

class PostTableViewCell: UITableViewCell {
    
    // MARK: переменные
    @IBOutlet weak var postAvatar: UIImageView!
    @IBOutlet weak var postMainPhoto: UIImageView!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postLikeImage: UIImageView!
    @IBOutlet weak var postCommentImage: UIImageView!
    @IBOutlet weak var postshareImage: UIImageView!
    @IBOutlet weak var postLikeCount: UILabel!
    @IBOutlet weak var postCommentCount: UILabel!
    @IBOutlet weak var postShareCount: UILabel!
    
    
    // MARK: действия кнопок
    /// метод поставить и убрать лайк
    
    @IBAction func likedPressed(_ sender: Any) {
        if postLikeCount.text == String(0){
            postLikeCount.text = String(1)}
        else {
            postLikeCount.text = String(0)
        }
}
  
    
    /// метод зашерить инфу
    
    @IBAction func sharePressed() {
      delegate?.share()
    
    }
    @IBAction func postOpenButton(_ sender: Any) {
        delegate?.didpressbutton()
    }
    weak var delegate: CustomCellDelegate?
   // MARK:  настройка ячейки
    func configurecell(with avaimage: UIImage, name: String, time: String, mainPhoto: UIImage, likeimage: UIImage, commentImage: UIImage, shareimage: UIImage, likeCount: Int, commentCount: Int, shareCount: Int, delegate: CustomCellDelegate){
        postAvatar.image = avaimage
        postMainPhoto.image = mainPhoto
        postName.text = name
        postTime.text = time
        postLikeImage.image = likeimage
        postCommentImage.image = commentImage
        postshareImage.image = shareimage
        postLikeCount.text = String(likeCount)
        postCommentCount.text = String(commentCount)
        postShareCount.text = String(shareCount)
        self.delegate = delegate
        
    }

}
