//
//  TableViewViewController.swift
//  homework2
//
//  Created by itisioslab on 03.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var newsArray : [News]! = [getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews()]
    let idintifier = "detailSegue"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 300
        tableView.addSubview(refreshControl)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.configureCell(with: newsArray[indexPath.row].name, vc: self, model: newsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier:idintifier, sender: newsArray[indexPath.row])
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        self.tableView.reloadData()
        newsArray = [getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews(),getRandomNews()]
        refreshControl.endRefreshing()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue", let news = sender as? News {
            
            if let destinationVC = segue.destination as? NewsViewController {
                destinationVC.news = news
            }
        }
    }
    

}
