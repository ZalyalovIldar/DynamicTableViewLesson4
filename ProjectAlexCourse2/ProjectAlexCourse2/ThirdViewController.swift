//
//  ThirdViewController.swift
//  ProjectAlexCourse2
//
//  Created by Александр Арсенюк on 17.09.2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

import UIKit



public extension ExpressibleByIntegerLiteral {
    /// метод генерации лучайных чисел
    ///
    /// - Returns: <#return value description#>
    public static func arc3random() -> Self {
        var r: Self = 0
        arc4random_buf(&r, MemoryLayout<Self>.size)
        return r
    }
}
// MARK: данные
let selfNameLabelArray = ["Gleb Glebov", "Ivan Ivanov", "Tom Tompson"]
let birthdayLabelArray = ["14 September 1990", "4 March 2000", "23 February 1988"]
let studiLabelArray = ["Kazan Federal University", "Moscow State University", "Oxford University"]
let instNameLabelArray = ["alxarsnk", "1233", "krut_official"]

class ThirdViewController: UIViewController, UITextFieldDelegate {
  
    // MARK:  переменные
    @IBOutlet weak var scrollBlockScrollView: UIScrollView!
    @IBOutlet var fullBlockView: UIView!
    @IBOutlet weak var mainInformblockView: UIView!
    @IBOutlet weak var avatarImagineView: UIImageView!
    @IBOutlet weak var selfNameLabel: UILabel!
    @IBOutlet weak var onLineStatusLabel: UILabel!
    @IBOutlet weak var onLineStatusIconImagineView: UIImageView!
    @IBOutlet weak var shortInfoLabel: UILabel!
    
    
    @IBOutlet weak var statusBlockView: UIView!
    @IBOutlet weak var statusNameLabel: UILabel!
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBOutlet weak var mainInfoBlockBiew: UIView!
    @IBOutlet weak var birthdayNameLAbel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var studiNameLAbel: UILabel!
    @IBOutlet weak var studiLabel: UILabel!
    @IBOutlet weak var lineImagineView: UIImageView!
    
    @IBOutlet weak var conatactBlockView: UIView!
    @IBOutlet weak var instaIconImagineView: UIImageView!
    @IBOutlet weak var vkIconImagineView: UIImageView!
    @IBOutlet weak var homeIconImagineView: UIImageView!
    @IBOutlet weak var instNameLabel: UILabel!
    @IBOutlet weak var homeCityLabel: UILabel!
    @IBOutlet weak var vknameLabel: UILabel!
    @IBOutlet weak var line1ImagineView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var line2ImagineView: UIImageView!
    
    
    @IBOutlet weak var educationBlockView: UIView!
    @IBOutlet weak var vuzNameLabel: UILabel!
    @IBOutlet weak var facLabel: UILabel!
    @IBOutlet weak var vuzLabel: UILabel!
    @IBOutlet weak var educationNameLabel: UILabel!
    
    
    @IBOutlet weak var giftBlockView: UIView!
    @IBOutlet weak var firPodImagineView: UIImageView!
    @IBOutlet weak var nextButtImagineView: UIImageView!
    @IBOutlet weak var thirPodImagineView: UIImageView!
    @IBOutlet weak var secPodImagineView: UIImageView!
    @IBOutlet weak var giftNameLabel: UILabel!
    @IBOutlet weak var toGiftListButton: UIButton!
    
    
    @IBOutlet weak var pageBlockView: UIView!
    @IBOutlet weak var toNotesButton: UIButton!
    @IBOutlet weak var toNoteWorthyPagesButton: UIButton!
    @IBOutlet weak var nextNotesIconImagineView: UIImageView!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var numOfNotesLAbel: UILabel!
    @IBOutlet weak var line3ImagineView: UIImageView!
    @IBOutlet weak var notevorthyPagesLabel: UILabel!
    @IBOutlet weak var numOfNoteworthyPagesLAbel: UILabel!
    @IBOutlet weak var toNoteWorthyPagesIconImagineView: UIImageView!
    @IBOutlet weak var backBlockNavigatiomItem: UINavigationItem!
    @IBOutlet weak var backItemButtonItem: UIBarButtonItem!
    
    let randomName = arc4random_uniform(UInt32(selfNameLabelArray.count))
    let randomBirth = arc4random_uniform(UInt32(birthdayLabelArray.count))
    let randomUniversity = arc4random_uniform(UInt32(studiLabelArray.count))
    let randomInstaName = arc4random_uniform(UInt32(instNameLabelArray.count))
    // MARK:  вид
  
    override func viewDidLoad() {
        super.viewDidLoad()
        statusTextField.delegate = self
        avatarImagineView.layer.cornerRadius = avatarImagineView.frame.size.width/2
        self.avatarImagineView.clipsToBounds = true
        birthdayLabel.text = birthdayLabelArray[Int(randomBirth)]
        selfNameLabel.text = selfNameLabelArray[Int(randomName)]
        studiLabel.text = studiLabelArray[Int(randomUniversity)]
        instNameLabel.text = instNameLabelArray[Int(randomInstaName)]
    }

    /// изменение статуса
    ///
    /// - Parameter textField: <#textField description#>
    /// - Returns: <#return value description#>
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /// корректное изменение статуса
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func change(_ sender: Any) {
        
    }
    
  
   

}
