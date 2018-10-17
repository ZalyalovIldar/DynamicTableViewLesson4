//
//  News.swift
//  homework2
//
//  Created by itisioslab on 06.10.2018.
//  Copyright © 2018 FirstGroupCompany. All rights reserved.
//

import Foundation
import UIKit

struct News {
    var name: String
    var surname: String
    var avatar: UIImage
    var text: String
    var like:Int
    var comment:Int
    var date:String
    var imageInNews:UIImage
    
    
}



func getRandomNews() -> News {
    let imageArr = [#imageLiteral(resourceName: "ava1"), #imageLiteral(resourceName: "ava2"),#imageLiteral(resourceName: "ava3")]
    let RandomNumber = Int(arc4random_uniform(UInt32(imageArr.count)))
    //imageArr is array of images
    let image = (imageArr[RandomNumber])
    
    let imageArr2 = [#imageLiteral(resourceName: "ava3"),#imageLiteral(resourceName: "ava2"),#imageLiteral(resourceName: "ava1"),#imageLiteral(resourceName: "gift1"),#imageLiteral(resourceName: "gift4"),#imageLiteral(resourceName: "gift3"),#imageLiteral(resourceName: "gift1"),#imageLiteral(resourceName: "images"),#imageLiteral(resourceName: "profile")]
    let imageInNews = (imageArr2[Int(arc4random_uniform(UInt32(imageArr2.count)))])
    
    return News.init(
        name: names[Int(arc4random_uniform(UInt32(names.count)))],
        surname: surnames[Int(arc4random_uniform(UInt32(surnames.count)))],
        avatar: image,
        text: asa[Int(arc4random_uniform(UInt32(asa.count)))],
        like: Int(arc4random_uniform(1000)),
        comment: Int(arc4random_uniform(50)),
        date: dates[Int(arc4random_uniform(UInt32(dates.count)))],
        imageInNews: imageInNews
        
    )
}
