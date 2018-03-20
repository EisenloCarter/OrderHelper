//
//  CheckOrderTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 17/3/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class CheckOrderTableViewController: UITableViewController {
    
    var finalShop = Shop(category:"", name:"", shopImage: "", shopLogo: "", deliveryTime: "", minDeliveryPrice: "", amount: "", foodNumber: 0)
    var address = Address()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        address.loadData()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 90
        }
        return 60
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath)
            let tmpAddress = cell.viewWithTag(1) as! UILabel
            tmpAddress.font = UIFont.boldSystemFont(ofSize: 30)
            
            let tmpName = cell.viewWithTag(2) as! UILabel
            tmpName.font = UIFont.boldSystemFont(ofSize: 15)
            
            if !address.addressList.isEmpty{
                tmpAddress.text = address.addressList[0].address + address.addressList[0].door
                tmpName.text = address.addressList[0].name + "  " + address.addressList[0].phone
            }
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
            
        }
        return cell
    }
    
}
