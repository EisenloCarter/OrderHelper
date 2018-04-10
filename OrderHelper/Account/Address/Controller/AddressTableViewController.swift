//
//  AddressTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 26/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class AddressTableViewController: UITableViewController {

    var address = Address()

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        address.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        address.loadData()
        return address.addressList.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath)
        
        let lbAddress = cell.viewWithTag(1) as! UILabel
        lbAddress.text = address.addressList[indexPath.row].address + " " + address.addressList[indexPath.row].door
        lbAddress.font=UIFont.boldSystemFont(ofSize: 20)
        
        let lbName = cell.viewWithTag(2) as! UILabel
        lbName.text = address.addressList[indexPath.row].name + " " + address.addressList[indexPath.row].phone
        lbName.font=UIFont.systemFont(ofSize: 15)
        lbName.textColor = UIColor.gray
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if address.addressList.count > 1{
            if editingStyle == .delete {
                // Delete the row from the data source
                address.loadData()
                address.addressList.remove(at: indexPath.row)
                address.saveData()
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            self.tableView.reloadData()
        }
        else{
            let alertController = UIAlertController(title: "系统提示",
                                                    message: "至少有一个收货地址",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }

}
