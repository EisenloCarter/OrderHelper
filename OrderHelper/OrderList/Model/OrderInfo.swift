//
//  OrderInfo.swift
//  OrderHelper
//
//  Created by spidepa on 22/3/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class OrderInfo: NSObject, NSCoding {
    var user:String
    var shopName:String
    var shopImage:String
    var time:String
    var price:String
    
    //构造方法
    required init(user:String = "", shopName:String = "", shopImage:String = "", time:String = "", price:String = "") {
        self.user = user
        self.shopName = shopName
        self.shopImage = shopImage
        self.time = time
        self.price = price
    }
    
    //从object解析回来
    required init(coder decoder: NSCoder) {
        self.user = decoder.decodeObject(forKey: "User") as? String ?? ""
        self.shopName = decoder.decodeObject(forKey: "ShopName") as? String ?? ""
        self.shopImage = decoder.decodeObject(forKey: "ShopImage") as? String ?? ""
        self.time = decoder.decodeObject(forKey: "Time") as? String ?? ""
        self.price = decoder.decodeObject(forKey: "Price") as? String ?? ""
    }
    
    //编码成object
    func encode(with coder: NSCoder) {
        coder.encode(user, forKey:"User")
        coder.encode(shopName, forKey:"ShopName")
        coder.encode(shopImage, forKey:"ShopImage")
        coder.encode(time, forKey:"Time")
        coder.encode(price, forKey:"Price")
    }
}

