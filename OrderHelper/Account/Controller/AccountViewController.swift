//
//  AccountViewController.swift
//  OrderHelper
//
//  Created by spidepa on 14/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var avatarImage: UIImageView!{
        didSet{
            avatarImage.roundImage()
        }
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
