//
//  AccountViewController.swift
//  OrderHelper
//
//  Created by spidepa on 14/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!{
        didSet{
            if(LoginHelper.sharedInstance.isLogin()){
                loginLabel.isHidden = true
            }
            else{
                loginLabel.isHidden = false
            }
        }
    }
    
    
    
    //            let imageSize = preLoginButton.imageRect(forContentRect: UIButton.frame)//获取图标的CGRect
    //            let titleFont = preLoginButton.titleLabel?.font//获取字体
    //            let titleSize = preLoginButton.currentTitle!.size(withAttributes:[NSAttributedStringKey.font: titleFont!])//获取文字的尺寸
    //            preLoginButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2) , bottom: 0, right: 0)
    //            preLoginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(titleSize.width * 2 + 10))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
