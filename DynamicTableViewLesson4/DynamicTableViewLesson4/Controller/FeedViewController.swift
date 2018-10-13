//
//  FeedViewController.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 12.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
    }

    @objc private func refreshWeatherData(_ sender: Any) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func registerNibs() {
        let nib = UINib(nibName: "UserFeedTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserFeedTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFeedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserFeedTableViewCell") as! UserFeedTableViewCell
        cell.parentViewController = self 
        let news = dataFeedArray[indexPath.row]
        cell.configureUI(with: news)
        return cell
    }
    
    // MARK: - Info transfer from UserFeedTableViewCell to DetailViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) as? UserFeedTableViewCell {
                let controller = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                
                controller.detailMainText = cell.mainTextLabel.text
                controller.detailImage = cell.avatatImageVew
                controller.detail = cell.titleLabel.text
                controller.subtitle = cell.subtitleLabel.text
                
                navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("CustomHeaderFeedTableViewCell", owner: self, options: nil)?.first as! CustomHeaderFeedTableViewCell
        return headerView
    }
    
}
