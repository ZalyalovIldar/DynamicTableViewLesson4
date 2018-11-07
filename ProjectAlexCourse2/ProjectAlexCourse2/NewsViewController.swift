//
//  NewsViewController.swift
//  ProjectAlexCourse2
//
//  Created by Александр Арсенюк on 03.10.2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

// MARK: - доп метод

import UIKit


// MARK: - data

struct Post {
    var avatar: UIImage
    var name: String
    var time: String
    var post: UIImage
    var likeImg: UIImage
    var comImg: UIImage
    var shareImg: UIImage
    var likeCnt: Int
    var commCnt: Int
    var sharecnt: Int
}

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    
    var dataManager: DataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.addSubview(self.refreshControl)
    }
    
    var countoflike = 0
    var countofcomments = 0
    var countofshares = 0
   
    
 
    // MARK: - настррйока таблицы
    
    func share() {
        
        let activityViewController = UIActivityViewController(activityItems: [dataManager.obtainRandomName()], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityType.copyToPasteboard,UIActivityType.airDrop,UIActivityType.addToReadingList,UIActivityType.assignToContact,UIActivityType.postToTencentWeibo,UIActivityType.postToVimeo,UIActivityType.print,UIActivityType.saveToCameraRoll,UIActivityType.postToWeibo]
        self.present(activityViewController, animated: true, completion: nil)

    }
    
    func didpressbutton() {
        
        let model = Post(avatar: dataManager.obatainRandomAvatar(), name: dataManager.obtainRandomName(), time: "5 minutes ago", post: dataManager.obtainRandomPhoto(), likeImg: #imageLiteral(resourceName: "likeimg"), comImg: #imageLiteral(resourceName: "com"), shareImg: #imageLiteral(resourceName: "share"), likeCnt: countoflike, commCnt: countofcomments, sharecnt: countofshares )
        performSegue(withIdentifier: "detailSegue", sender: model)
    }
    /// колличество ячеек в таблице
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "true", for: indexPath) as! PostTableViewCell
        cell.configurecell(with: dataManager.obatainRandomAvatar(), name: dataManager.obtainRandomName(), time: "5 minutes ago", mainPhoto: dataManager.obtainRandomPhoto(), likeimage: #imageLiteral(resourceName: "likeimg"), commentImage: #imageLiteral(resourceName: "com"), shareimage: #imageLiteral(resourceName: "share"), likeCount: countoflike, commentCount: countofcomments, shareCount: countofshares, delegate: self)
        return cell
    }
    /// свзяь поста со страницей в которой он открывается в новом контроллере
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "detailSegue", let model = sender as? Post {
            let destinationController = segue.destination as! InfoPostViewController
            destinationController.test1 = model
        }
    }
   
    // MARK: - обновление контента
    
    /// тянем вниз, получаем анимацию и обновление данных
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
        #selector(NewsViewController.handleRefresh(_:)),
        for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    /// Обновление данных при скроле вверх
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
 }
