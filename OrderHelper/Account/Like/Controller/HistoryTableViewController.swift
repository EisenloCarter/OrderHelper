//
//  HistoryTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 26/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
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
        return 0
    }

}
