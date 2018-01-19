//
//  UIImageView+Extensions.swift
//  OrderHelper
//
//  Created by spidepa on 19/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

extension UIImageView {
    //MARK: 圆形图片与边框
    func roundImage(){
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
    }
}
