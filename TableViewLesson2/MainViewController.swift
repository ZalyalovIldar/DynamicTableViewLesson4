//
//  MainViewController.swift
//  TableViewLesson2
//
//  Created by Ильдар Залялов on 01/10/2018.
//  Copyright © 2018 Ильдар Залялов. All rights reserved.
//

import UIKit

struct SomeObject {
    var image: UIImage
    var text: String
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    /// Идентификатор ячейки
    fileprivate let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
    }

    //MARK: - UITableView delegate&datasource
    
    /// Description descrition
    ///
    /// - Parameters:
    ///   - a: some param
    ///   - b: second param
    /// - Returns: non null value
    func calculate(a: Int, and b: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CustomTableViewCell
        
        cell.configureCell(with: #imageLiteral(resourceName: "Thinking_Face_Emoji_large"), nameString: "SomeName", delegate: self)
        
        if indexPath.row % 2 == 0 {
            cell.configureCell(with: #imageLiteral(resourceName: "Thinking_Face_Emoji_large"), nameString: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", delegate: self)
        }
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue", let model = sender as? SomeObject {
            
            let destinationController = segue.destination as! ViewController
            destinationController.model = model
        }
    }
    
    //MARK: - CustomCellDelegate
    
    func didPressInfoButton() {
        
        let model = SomeObject(image: #imageLiteral(resourceName: "Thinking_Face_Emoji_large"), text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
        
        performSegue(withIdentifier: "detailSegue", sender: model)
    }
}

