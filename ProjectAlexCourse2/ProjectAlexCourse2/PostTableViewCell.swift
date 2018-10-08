//
//  PostTableViewCell.swift
//  ProjectAlexCourse2
//
//  Created by Александр Арсенюк on 03.10.2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

import UIKit
protocol CustomCellDelegate: class {
    func didpressbutton()
}

class PostTableViewCell: UITableViewCell {

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
    
    /// метод поставить и убрать лайк
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func likedPressed(_ sender: Any) {
        if postLikeCount.text == String(0){
            postLikeCount.text = String(1)}
        else {
            postLikeCount.text = String(0)
        }
}
  
    
    /// метод зашерить инфу
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func sharedPressed(_ sender: Any) {
        if postShareCount.text == String(0){
            postShareCount.text = String(1)}
        else {
            postShareCount.text = String(0)
        }
    }
    @IBAction func postOpenButton(_ sender: Any) {
        delegate?.didpressbutton()
    }
    weak var delegate: CustomCellDelegate?
   
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
