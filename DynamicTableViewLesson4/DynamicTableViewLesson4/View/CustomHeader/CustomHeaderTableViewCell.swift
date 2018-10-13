//
//  CustomTableViewCell.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 10.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

protocol CustomHeaderTableViewCellDelegate {
    func headerButtonDidPushed()
}

class CustomTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var data = [HeaderCollectionViewInfo]()
    
    var delegate: CustomHeaderTableViewCellDelegate?
    
    @IBOutlet weak var avatarSmallImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!

    @IBOutlet weak var allFeedButton: UIButton!
    @IBAction func infoButton(_ sender: UIButton) {
        delegate?.headerButtonDidPushed()
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        avatarImageView.roundedImage()
        avatarSmallImageView.roundedImage()
        editButton.layer.cornerRadius = editButton.frame.height / 2
        editButton.clipsToBounds = true
        
        allFeedButton.layer.cornerRadius = editButton.frame.height / 2
        allFeedButton.clipsToBounds = true
        
        registerNibs()
        
        data.append(HeaderCollectionViewInfo(count: "32", description: "друга"))
        data.append(HeaderCollectionViewInfo(count: "30", description: "групп"))
        data.append(HeaderCollectionViewInfo(count: "5", description: "фото"))
        data.append(HeaderCollectionViewInfo(count: "34", description: "видео"))
        data.append(HeaderCollectionViewInfo(count: "611", description: "аудио"))
        data.append(HeaderCollectionViewInfo(count: "207", description: "файла"))
        data.append(HeaderCollectionViewInfo(count: "11", description: "карт"))


    }
    
    func registerNibs() {
        self.collectionView.register(UINib.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
        /*
        if collectionView == self.collectionView {
            return 10
        } else if collectionView == self.imageCollectionView {
            
        }
        return 10
        */
 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath as IndexPath) as! CustomCollectionViewCell
        let infoJson = data[indexPath.row]
        cell.configureCell(with: infoJson)
        
        return cell
    }
    
}
