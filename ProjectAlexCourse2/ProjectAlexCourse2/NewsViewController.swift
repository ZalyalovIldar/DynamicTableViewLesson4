//
//  NewsViewController.swift
//  ProjectAlexCourse2
//
//  Created by Александр Арсенюк on 03.10.2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

// MARK: доп метод
import UIKit
public extension ExpressibleByIntegerLiteral {
    public static func arc4random() -> Self {
        var r: Self = 0
        arc4random_buf(&r, MemoryLayout<Self>.size)
        return r
    }
}

// MARK: data
let postArray: [UIImage] = [#imageLiteral(resourceName: "post2"),#imageLiteral(resourceName: "post1"),#imageLiteral(resourceName: "post3")]
let avatarArray: [UIImage] = [#imageLiteral(resourceName: "avatar1"),#imageLiteral(resourceName: "avatar2"),#imageLiteral(resourceName: "avatar3")]
let nameArray: [String] = ["Public Number One","Public Number Two", "Public Number Three", "Я дарю тебе 10 строк 9 жизней на всякий случай,8 шансов не быть живучей. Перекрёсток 7 дорог,Оптимизм 6 напутствий.Я даю тебе «5» — почувствуй4-стихийный экстаз!Я 3 раза смеюсь — от сглаза,И 2 раза реву — зараза,У меня это в 1-ый раз", "        ", "Random Text"]
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
    
    var countoflike = 0
    var countofcomments = 0
    var countofshares = 0
    let randomName = arc4random_uniform(UInt32(nameArray.count))
    let randomAvatar = arc4random_uniform(UInt32(avatarArray.count))
    let randomPost = arc4random_uniform(UInt32(postArray.count))
    // MARK:   настррйока таблицы
    
    func share(){
        let activityController = UIActivityViewController(activityItems: ["text"], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    func didpressbutton() {
        
        let model = Post(avatar: avatarArray[Int(randomAvatar)], name: nameArray[Int(randomName)], time: "5 minutes ago", post: postArray[Int(randomPost)], likeImg: #imageLiteral(resourceName: "likeimg"), comImg: #imageLiteral(resourceName: "com"), shareImg: #imageLiteral(resourceName: "share"), likeCnt: countoflike, commCnt: countofcomments, sharecnt: countofshares )
        performSegue(withIdentifier: "detailSegue", sender: model)
    }
    /// колличество ячеек в таблице
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let randomName = arc4random_uniform(UInt32(nameArray.count))
        let randomAvatar = arc4random_uniform(UInt32(avatarArray.count))
        let randomPost = arc4random_uniform(UInt32(postArray.count))
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "true") as! PostTableViewCell
 
        cell.configurecell(with: avatarArray[Int(randomAvatar)], name: nameArray[Int(randomName)], time: "5 minutes ago", mainPhoto: postArray[Int(randomPost)], likeimage: #imageLiteral(resourceName: "likeimg"), commentImage: #imageLiteral(resourceName: "com"), shareimage: #imageLiteral(resourceName: "share"), likeCount: countoflike, commentCount: countofcomments, shareCount: countofshares, delegate: self)
        return cell
    }
    /// свзяь поста со страницей в которой он открывается в новом контроллере
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue", let model = sender as? Post {
            
            let destinationController = segue.destination as! InfoPostViewController
            destinationController.model = model
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.addSubview(self.refreshControl)
    }
    
    /// тянем вниз, получаем анимацию и обновление данных
   // MARK: обновление контента
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
