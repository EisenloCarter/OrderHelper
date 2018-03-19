//
//  FoodInfo.swift
//  OrderHelper
//
//  Created by spidepa on 15/3/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class FoodInfo: NSObject, NSCoding {
    var shopName:String
    var name:String
    var image:String
    var price:String
    
    //构造方法
    required init(shopName:String = "", name:String = "", image:String = "", price:String = "") {
        self.shopName = shopName
        self.name = name
        self.image = image
        self.price = price
    }
    
    //从object解析回来
    required init(coder decoder: NSCoder) {
        self.shopName = decoder.decodeObject(forKey: "ShopName") as? String ?? ""
        self.name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.image = decoder.decodeObject(forKey: "Image") as? String ?? ""
        self.price = decoder.decodeObject(forKey: "Price") as? String ?? ""
    }
    
    //编码成object
    func encode(with coder: NSCoder) {
        coder.encode(shopName, forKey:"ShopName")
        coder.encode(name, forKey:"Name")
        coder.encode(image, forKey:"Image")
        coder.encode(price, forKey:"Price")
    }
}
