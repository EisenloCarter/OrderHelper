//
//  DetailTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 13/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBAction func fakeReturnButton(_ sender: UIBarButtonItem) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO : 设置Nav背景没效果
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"1.jpg"), for: UIBarMetrics.default)

//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

}
