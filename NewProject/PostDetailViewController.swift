//
//  PostDetailViewController.swift
//  NewProject
//
//  Created by Гузель on 04.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameOfGroupLabel: UILabel!
    @IBOutlet weak var textOfPostLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    weak var mainViewController: NewsViewController!
    var selectedIndex:Int!
    
    // MARK: - Методы -

    override func viewDidLoad() {
        super.viewDidLoad()
        filling()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Adding content and sharing -
    
    ///заполнение данных из основного контроллера в новое окно детальной информации.
    func filling() {
        self.avatarImageView.image = mainViewController.somePostArray[selectedIndex].avatar
        self.nameOfGroupLabel.text = mainViewController.somePostArray[selectedIndex].name
        self.textOfPostLabel.text = mainViewController.somePostArray[selectedIndex].description
        self.contentImageView.image = mainViewController.somePostArray[selectedIndex].someImage
    }

    ///метод для шаринга с помощью UIActivityViewController
    @IBAction func sharingAction(_ sender: Any) {
        
        var defaultMessage = "default"
        if textOfPostLabel.text != nil {
            defaultMessage = textOfPostLabel.text!
        }
        let activityController = UIActivityViewController(activityItems: [defaultMessage], applicationActivities: nil)
        mainViewController.present(activityController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
