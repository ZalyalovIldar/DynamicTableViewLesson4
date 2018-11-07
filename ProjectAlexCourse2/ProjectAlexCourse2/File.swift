//
//  File.swift
//  ProjectAlexCourse2
//
//  Created by Александр Арсенюк on 07/11/2018.
//  Copyright © 2018 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

public extension ExpressibleByIntegerLiteral {
    public static func arc4random() -> Self {
        var r: Self = 0
        arc4random_buf(&r, MemoryLayout<Self>.size)
        return r
    }
}
let postArray: [UIImage] = [#imageLiteral(resourceName: "post2"),#imageLiteral(resourceName: "post1"),#imageLiteral(resourceName: "post3")]
let avatarArray: [UIImage] = [#imageLiteral(resourceName: "avatar1"),#imageLiteral(resourceName: "avatar2"),#imageLiteral(resourceName: "avatar3")]
let nameArray: [String] = ["Public Number One","Public Number Two", "Public Number Three", "Я дарю тебе 10 строк 9 жизней на всякий случай,8 шансов не быть живучей. Перекрёсток 7 дорог,Оптимизм 6 напутствий.Я даю тебе «5» — почувствуй4-стихийный экстаз!Я 3 раза смеюсь — от сглаза,И 2 раза реву — зараза,У меня это в 1-ый раз", "        ", "Random Text"]

let randomName = arc4random_uniform(UInt32(nameArray.count))
let randomAvatar = arc4random_uniform(UInt32(avatarArray.count))
let randomPost = arc4random_uniform(UInt32(postArray.count))

class DataManager {
    
    func obtainRandomPhoto () -> UIImage {
        return postArray[Int(randomPost)]
    }
    func obatainRandomAvatar () -> UIImage {
        return avatarArray[Int(randomAvatar)]
    }
    func obtainRandomName () -> String {
        return nameArray[Int(randomName)]
    }
    
}
