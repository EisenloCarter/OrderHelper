//
//  OrderTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 23/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {

    var order = Order()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        order.loadData()
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
        return order.orderList.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        if order.orderList.count > 0 {
            let orderImage = cell.viewWithTag(1) as! UIImageView
            orderImage.image = UIImage(named: order.orderList[indexPath.row].shopImage)
            
            let orderShopName = cell.viewWithTag(2) as! UILabel
            orderShopName.text = order.orderList[indexPath.row].shopName
            
            let orderTime = cell.viewWithTag(3) as! UILabel
            orderTime.font = UIFont.systemFont(ofSize: 12)
            orderTime.textColor = UIColor.gray
            orderTime.text = order.orderList[indexPath.row].time
            
//            let orderState = cell.viewWithTag(4) as! UILabel
            
            let orderCost = cell.viewWithTag(5) as! UILabel
            orderCost.text = order.orderList[indexPath.row].price
        }
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if order.orderList.count > 1{
            if editingStyle == .delete {
                // Delete the row from the data source
                order.loadData()
                order.orderList.remove(at: indexPath.row)
                order.saveData()
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            self.tableView.reloadData()
        }
        else{
            let alertController = UIAlertController(title: "系统提示",
                                                    message: "至少有一条订单信息",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
