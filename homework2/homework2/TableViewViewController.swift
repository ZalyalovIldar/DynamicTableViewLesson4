//
//  TableViewViewController.swift
//  homework2
//
//  Created by itisioslab on 03.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var news: News!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 300
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        news = getRandomNews()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.configureCell(with: news.name, vc: self, model: news)
        if indexPath.row % 2 == 0 {
            cell.configureCell(with: news.name, vc: self, model: news)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
        news = getRandomNews()
        refreshControl.endRefreshing()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            
            if let destinationVC = segue.destination as? NewsViewController {
                destinationVC.news = news
            }
        }
    }
    

}
