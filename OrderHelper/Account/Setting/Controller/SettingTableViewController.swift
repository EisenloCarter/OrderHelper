//
//  SettingTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 19/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    @IBOutlet weak var avatarCell: UITableViewCell!
    @IBOutlet weak var userNameCell: UITableViewCell!
    @IBOutlet weak var phoneCell: UITableViewCell!
    
    @IBOutlet weak var loginPasswordCell: UITableViewCell!
    @IBOutlet weak var payPasswordCell: UITableViewCell!
    
    @IBOutlet weak var aboutCell: UITableViewCell!
    
    @IBAction func logOutButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

