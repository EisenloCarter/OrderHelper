//
//  AllShopTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 25/3/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class AllShopTableViewController: UITableViewController {

    var shop = [Shop]()
    var tempShop = Shop(category:"", name:"", shopLogo: "", deliveryTime: "", minDeliveryPrice: "", amount: "", foodNumber: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shop = [
            Shop(category:"快餐便当", name:"杨国福麻辣烫", shopLogo: "ygfLogo.jpg", deliveryTime: "28 mins", minDeliveryPrice: "¥20", amount: "月售10单", foodNumber: 1),
            Shop(category:"小吃零食", name:"绝味鸭脖", shopLogo: "jwybLogo.jpg", deliveryTime: "30 mins", minDeliveryPrice: "¥20", amount: "月售10单", foodNumber: 1),
            Shop(category:"快餐便当", name:"肯德基", shopLogo: "kdjLogo.jpg", deliveryTime: "32 mins", minDeliveryPrice: "¥25", amount: "月售15单", foodNumber: 4),
            Shop(category:"快餐便当", name:"麦当劳", shopLogo: "mdlLogo.jpg", deliveryTime: "25 mins", minDeliveryPrice: "¥25", amount: "月售12单", foodNumber: 2),
            Shop(category:"快餐便当", name:"必胜客", shopLogo: "bskLogo.jpg", deliveryTime: "30 mins", minDeliveryPrice: "¥35", amount: "月售8单", foodNumber: 2),
            Shop(category:"甜品饮品", name:"星巴克", shopLogo: "xbkLogo.jpg", deliveryTime: "25 mins", minDeliveryPrice: "¥22", amount: "月售6单", foodNumber: 2),
            Shop(category:"传统美食", name:"一粥七天", shopLogo: "yzqtLogo.jpg", deliveryTime: "35 mins", minDeliveryPrice: "¥18", amount: "月售12单", foodNumber: 1),
            Shop(category:"甜品饮品", name:"COCO都可", shopLogo: "COCOLogo.jpg", deliveryTime: "30 mins", minDeliveryPrice: "¥18", amount: "月售15单", foodNumber: 1),
            Shop(category:"甜品饮品", name:"蔚甜品", shopLogo: "wtpLogo.jpg", deliveryTime: "28 mins", minDeliveryPrice: "¥20", amount: "月售9单", foodNumber: 1),
            Shop(category:"传统美食", name:"美味餐厅", shopLogo: "mwctLogo.jpg", deliveryTime: "32 mins", minDeliveryPrice: "¥20", amount: "月售25单", foodNumber: 1),
            Shop(category:"小吃零食", name:"滋味烧烤", shopLogo: "skLogo.jpg", deliveryTime: "26 mins", minDeliveryPrice: "¥25", amount: "月售32单", foodNumber: 1),
            Shop(category:"传统美食", name:"兰州拉面", shopLogo: "lzlmLogo.jpg", deliveryTime: "25 mins", minDeliveryPrice: "¥18", amount: "月售2单", foodNumber: 1)]
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
        return shop.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllResultsCell", for: indexPath)

        let shopLogo = cell.viewWithTag(1) as! UIImageView
        shopLogo.image = UIImage(named: shop[indexPath.row].shopLogo)
        
        let shopNameLabel = cell.viewWithTag(2) as! UILabel
        shopNameLabel.text = shop[indexPath.row].name
        
        let amountLabel = cell.viewWithTag(5) as! UILabel
        amountLabel.text = shop[indexPath.row].amount
        amountLabel.textColor = UIColor.gray
        amountLabel.font = UIFont.systemFont(ofSize: 12)
        
        let minDeliveryPriceLabel = cell.viewWithTag(3) as! UILabel
        minDeliveryPriceLabel.text = shop[indexPath.row].minDeliveryPrice + "起送"
        minDeliveryPriceLabel.textColor = UIColor.gray
        minDeliveryPriceLabel.font = UIFont.systemFont(ofSize: 12)
        
        let deliveryTimeLabel = cell.viewWithTag(4) as! UILabel
        deliveryTimeLabel.text = "大约" + shop[indexPath.row].deliveryTime + "送达"
        deliveryTimeLabel.textColor = UIColor.gray
        deliveryTimeLabel.font = UIFont.systemFont(ofSize: 12)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        tempShop = shop[indexPath.row]
        print(tempShop.name)
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SRtoDVC2"{
            if let nav = segue.destination as? UINavigationController,
                let controller = nav.topViewController as? DetailViewController {
                controller.tmpShop = tempShop
            }
        }
    }
}
