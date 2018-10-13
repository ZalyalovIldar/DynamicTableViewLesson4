//
//  ViewController.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 09.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

var dataFeedArray = [Feed]()

var dataHeaderArray = [HeaderInfoStruct]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomHeaderTableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 500
        addTestItems()
    }
    
    // MARK: - Adding test items to an array
    func addTestItems() {
        dataFeedArray.append(Feed(subtitle: "7 окт в 1:41", text:
            """
    Робин Шульц (нем. Robin Schulz) — немецкий диджей. Играет в жанрах поп и tropical house.
""", title: "Robin Schulz", image: "rS" ))
        dataFeedArray.append(Feed(subtitle: "3 окт в 14:21", text: """
    Феликс де Лат (нидерл. Felix De Laet; род. 30 ноября 1993, Брюссель, Бельгия), более известный по сценическому имени Lost Frequencies (с англ. — «Потерянные частоты») — бельгийский музыкальный продюсер и диджей. Наиболее известен синглами «Are You with Me» (2014) и «Reality». В 2017 году занял 26 место в списке лучших диджеев мира по версии журнала DJ Magazine.
""", title: "Lost Frequencies", image: "lS"))
        dataFeedArray.append(Feed(subtitle: "2 окт в 19:40", text:
            """
    Оливер Хелденс (англ. Oliver Heldens; род. 1 февраля 1995, Роттердам) — музыкальный продюсер из Нидерландов. В 2013 году его трек «Gecko», вышедший 30 декабря, вызвал интерес у Tiësto, лейбл которого подписал с Оливером контракт и выпустил вокальную версию «Gecko» с Бекки Хилл — «Overdrive» 23 июня 2014 года, которая достигла 1 места в UK Singles Chart. Имеет своё радиошоу под названием Heldeep, которое в России выходит на радиостанции Record (с 21:00 до 22:00 по московскому времени каждое воскресенье). В 2014 году дебютировал в мировом рейтинге диджеев «DJ MAG Top 100 DJs» заняв 34 место. Сейчас считается главным лицом на сцене Future House. Подписан на лейблы Spinnin' Records, Doorn Records. Имеет свою звукозаписывающую студию Heldeep Records. В 2016 году стал 8-м по версии DJ MAG TOP 100 2016. В 2017 году занял 13 место в списке лучших диджеев мира по версии DJ Magazine.
""", title: "Oliver Heldens", image: "oH" ))
    }
    
    func registerNibs() {
        let headerNib = UINib(nibName: "CustomHeaderTableViewCell", bundle: nil)
        tableView.register(headerNib, forCellReuseIdentifier: "CustomTableViewCell")
        
        
        let nib = UINib(nibName: "UserFeedTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserFeedTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFeedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserFeedTableViewCell") as! UserFeedTableViewCell
        let news = dataFeedArray[indexPath.row]
        cell.configureUI(with: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("CustomHeaderTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 455
    }

    func headerButtonDidPushed() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        navigationController?.pushViewController(controller!, animated: true)
    }
}
