//
//  AccountViewController.swift
//  OrderHelper
//
//  Created by spidepa on 14/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
    
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

        // MARK: 去除导航栏分割线
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // MARK: 去除多余cell
        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
