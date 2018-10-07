//
//  DetialPostViewController.swift
//  VKClone
//
//  Created by Петр on 07/10/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import UIKit

class DetailedPostViewController: UIViewController {
    
    @IBOutlet weak var groupAvatarImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    @IBAction func didShareButtonPressed(_ sender: Any) {
        
        guard post.postText != "" else { return }
        let text = post.postText
        let vc = UIActivityViewController(activityItems: [text], applicationActivities: [])
        
        if let popoverController = vc.popoverPresentationController {
            
            popoverController.sourceView = self.view
            popoverController.sourceRect = self.view.bounds
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        congigureDetailedPost()
    }
    
    
    /// Configures cell with given post
    func congigureDetailedPost() {
        
        groupAvatarImage.image = UIImage(named: post.groupAvatar)
        groupNameLabel.text = post.groupName
        postDateLabel.text = post.postDate
        postTextLabel.text = post.postText
        postImage.image = UIImage(named: post.postImageLink)
        likesCountLabel.text = String(post.likesCount)
        commentsCountLabel.text = String(post.commentsCount)
        viewsCountLabel.text = String(post.viewsCount)
        
        applyStyles()
    }
    
    /// Applies styles to view objects
    func applyStyles() {
        
        groupAvatarImage.layer.cornerRadius = groupAvatarImage.frame.width / 2
        groupAvatarImage.clipsToBounds = true
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
