//
//  Post.swift
//  NewProject
//
//  Created by Гузель on 04.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    var name:String
    var avatar:UIImage
    var description:String?
    var someImage:UIImage?
    
    // MARK: - Инициализация -
    
    ///инициализация
    init(name:String, avatar:UIImage, description:String?, someImage:UIImage?) {
        self.name = name
        self.avatar = avatar
        self.description = description
        self.someImage = someImage
    }
}
