//
//  ViewController.swift
//  OrderHelper
//
//  Created by spidepa on 4/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func LoginButton(_ sender: UIButton) {
        LoginHelper.sharedInstance.setLoginStatus(status: true)
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

