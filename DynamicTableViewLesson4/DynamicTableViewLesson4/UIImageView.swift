//
//  UIImageView.swift
//  DynamicTableViewLesson4
//
//  Created by Ришат Якушев on 09.10.2018.
//  Copyright © 2018 Ришат Якушев. All rights reserved.
//

import UIKit

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
