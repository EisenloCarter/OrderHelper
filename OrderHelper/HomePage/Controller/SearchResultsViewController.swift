//
//  SearchResultsViewController.swift
//  te
//
//  Created by spidepa on 1/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit
import LeanCloud

class SearchResultsViewController: UITableViewController {
    
    var shop = [Shop]()
    var tempShop = Shop(category:"", name:"", shopLogo: "", deliveryTime: "", minDeliveryPrice: "", amount: "", foodNumber: 0)
    
    private var results = [NSAttributedString]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func search(_ text: String, in items: [String]) {
        results = items.flatMap { item in
            let matchedRange = (item as NSString).range(of: text, options: .caseInsensitive)
            guard matchedRange.location != NSNotFound else {
                return nil
            }
            return highlighted(string: item, in: matchedRange)
        }
    }
    
    private func highlighted(string s: String, in range: NSRange) -> NSAttributedString {
        let s = NSMutableAttributedString(string: s)
        s.beginEditing()
        let highlightAttributes: [NSAttributedStringKey : Any] = [
            .foregroundColor : UIColor.blue,
            ]
        s.addAttributes(highlightAttributes, range: range)
        s.endEditing()
        return s
    }
    
    func reset() {
        results.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createShopData()
    }
    
    func createShopData(){
        let query = LCQuery(className: "Shop")
        query.whereKey("pic", .existed)
        query.find { result in
            switch result {
            case .success(let objects):
                for resultShop in objects{
                    let addThis = Shop( category: resultShop.get("category")!.stringValue ?? "???",
                                                 name: resultShop.get("name")!.stringValue ?? "???",
                                                 shopLogo: resultShop.get("shopLogo")!.stringValue ?? "???",
                                                 deliveryTime: resultShop.get("deliveryTime")!.stringValue ?? "???",
                                                 minDeliveryPrice: resultShop.get("minDeliveryPrice")!.stringValue ?? "???",
                                                 amount: resultShop.get("amount")!.stringValue ?? "???",
                                                 foodNumber: resultShop.get("foodNumber")!.intValue ?? 0)
                    self.shop.append(addThis)
                }
            case .failure(let error):
                print(error)
            }
        }
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
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultsCell", for: indexPath)
        
        if shop.contains(where: { (snapShop) -> Bool in
            tempShop = snapShop
            return snapShop.name == results[indexPath.row].string
        }){
            let shopLogo = cell.viewWithTag(1) as! UIImageView
            shopLogo.image = UIImage(named: tempShop.shopLogo)
            
            let shopNameLabel = cell.viewWithTag(2) as! UILabel
            shopNameLabel.attributedText = results[indexPath.row]
            
            let amountLabel = cell.viewWithTag(5) as! UILabel
            amountLabel.text = tempShop.amount
            amountLabel.textColor = UIColor.gray
            amountLabel.font = UIFont.systemFont(ofSize: 12)
            
            let minDeliveryPriceLabel = cell.viewWithTag(3) as! UILabel
            minDeliveryPriceLabel.text = tempShop.minDeliveryPrice + "起送"
            minDeliveryPriceLabel.textColor = UIColor.gray
            minDeliveryPriceLabel.font = UIFont.systemFont(ofSize: 12)
            
            let deliveryTimeLabel = cell.viewWithTag(4) as! UILabel
            deliveryTimeLabel.text = "大约" + tempShop.deliveryTime + "送达"
            deliveryTimeLabel.textColor = UIColor.gray
            deliveryTimeLabel.font = UIFont.systemFont(ofSize: 12)
        }
        return cell
    }
    
    //传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SRtoDVC"{
            if let nav = segue.destination as? UINavigationController,
                let controller = nav.topViewController as? DetailViewController {
                controller.tmpShop = tempShop
            }
        }
    }
    
}

