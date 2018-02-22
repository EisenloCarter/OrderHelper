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
    var preferentialNames = ["优惠活动1","优惠活动2","优惠活动3","优惠活动4","优惠活动5","优惠活动6"]

    var preferentialImages = ["preferential1.jpg","preferential2.jpg","preferential3.jpg","preferential4.jpg","preferential5.jpg","preferential6.jpg"]
    
    var tmpString: String = ""
    var preferentail = [Preferential]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferentail = [
            Preferential(name: "优惠活动1", image: "preferentail1.jpg"),
            Preferential(name: "优惠活动2", image: "preferentail2.jpg"),
            Preferential(name: "优惠活动3", image: "preferentail3.jpg"),
            Preferential(name: "优惠活动4", image: "preferentail4.jpg"),
            Preferential(name: "优惠活动5", image: "preferentail5.jpg"),
            Preferential(name: "优惠活动6", image: "preferentail6.jpg")
        ]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return preferentialNames.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "findCell", for: indexPath)

        cell.imageView?.image = UIImage(named: preferentialImages[indexPath.section])
        return cell
    }

    //传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FTtoFD"{
            let obj = segue.destination as! FindDetailViewController
            obj.tmpString = preferentialNames[(tableView.indexPathForSelectedRow?.section)!]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
