//
//  AddressInfo.swift
//  OrderHelper
//
//  Created by spidepa on 19/3/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//
import UIKit

class AddressInfo: NSObject, NSCoding {
    var name:String
    var phone:String
    var address:String
    var door:String
    
    //构造方法
    required init(name:String = "", phone:String = "", address:String = "", door:String = "") {
        self.name = name
        self.phone = phone
        self.address = address
        self.door = door
    }
    
    //从object解析回来
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.phone = decoder.decodeObject(forKey: "Phone") as? String ?? ""
        self.address = decoder.decodeObject(forKey: "Address") as? String ?? ""
        self.door = decoder.decodeObject(forKey: "Door") as? String ?? ""
    }
    
    //编码成object
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey:"Name")
        coder.encode(phone, forKey:"Phone")
        coder.encode(address, forKey:"Address")
        coder.encode(door, forKey:"Door")
    }
}

