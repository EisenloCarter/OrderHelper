//
//  FindTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 23/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class FindTableViewController: UITableViewController {
    // MARK: - Table view data source
    var preferentialNames = ["preferential1","preferential2","preferential3","preferential4","preferential5","preferential6"]

    var preferentialImages = ["preferential1.jpg","preferential2.jpg","preferential3.jpg","preferential4.jpg","preferential5.jpg","preferential6.jpg"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return preferentialNames.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    //TODO: 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "findCell", for: indexPath)
        //cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: preferentialImages[indexPath.section])
        
        // Configure the cell...
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
