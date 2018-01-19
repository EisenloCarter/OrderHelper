//
//  LoginHelper.swift
//  OrderHelper
//
//  Created by spidepa on 14/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit
import LeanCloud

// 登录状态的key
private let LoginStatus = "LoginStatus"

class LoginHelper: NSObject {
    // 实现单例
    static let sharedInstance = LoginHelper()
    private override init() {} // 防止使用()初始化
    
    // 获取登录状态
    func isLogin() -> Bool {
        if let status : Bool = UserDefaults.standard.object(forKey: LoginStatus) as? Bool
        {
            return status
        }
        return false
    }
    
    // 保存登录状态
    func setLoginStatus(status : Bool) {
        UserDefaults.standard.set(status, forKey: LoginStatus)
    }
    
//    func isUser(phoneNumber : String) -> Bool {
//        let query = LCQuery(className: "_User")
//        print(query)
//    }
}
