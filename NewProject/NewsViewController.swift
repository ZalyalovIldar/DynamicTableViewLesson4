//
//  NewsViewController.swift
//  NewProject
//
//  Created by Гузель on 03.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var somePostArray:[Post] = []
    var refreshControl:UIRefreshControl?
    var identifier1 = "cell"
    var segueIdentifier = "postDetailIdentifier"
    
    // MARK: - Методы -
    
    
    /// метод создающий Array, в который добавляются данные, и который потом присвоится нашему основному somePostArray
    ///
    /// - Returns: array, который потом присвоится основному
    func createNewPostArray() -> [Post] {
        var currentArray:[Post] = []
        
        let post1 = Post(name: "Kitty", avatar: #imageLiteral(resourceName: "kitty"), description: nil, someImage: #imageLiteral(resourceName: "kitty"))
        let post2 = Post(name: "My paper", avatar: #imageLiteral(resourceName: "avatar"), description: "SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE ", someImage: #imageLiteral(resourceName: "paper"))
        let post3 = Post(name: "Chill", avatar: #imageLiteral(resourceName: "avatar"), description: "October calendar", someImage: #imageLiteral(resourceName: "calendarw"))
        
        currentArray.append(post1)
        currentArray.append(post2)
        currentArray.append(post3)
        
        return currentArray
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        somePostArray = createNewPostArray()
        tableView.estimatedRowHeight = 400
        
        //pull-to-refresh
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action:  #selector(reloading), for: UIControlEvents.valueChanged)
    }
    
    
    /// обновление данных
    @objc func reloading() {
        
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
    
    // MARK: - funcs of TableView -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return somePostArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier1) as! CustomTableViewCell
        
        cell.addingContent(post: (self.somePostArray[indexPath.row]), controller: self)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let nextVC = segue.destination as? PostDetailViewController {
                nextVC.mainViewController = self
                nextVC.selectedIndex = tableView.indexPathForSelectedRow?.row
            }
        }
    }
}
