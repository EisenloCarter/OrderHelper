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
    lazy var imp = [String](repeating: "0", count: finalShop.foodNumber)
    var food = Food()
    var secNum = 0
    var TotalPrice = ""
    var order = Order()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        address.loadData()
        addFooterButton()
        
        secNum = imp.filter({ (tmp) -> Bool in
            tmp != "0"
        }).count
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    func addFooterButton(){
        let payButton = UIButton()
        payButton.frame = CGRect(x: 0,y: 0,width: 60,height: 60)
        payButton.setTitle("确认订单", for: .normal)
        payButton.layer.cornerRadius = 10.0;
        payButton.backgroundColor = UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        payButton.setTitleColor(UIColor.white, for: .normal)
        payButton.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        self.tableView.tableFooterView = payButton
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
        else if indexPath.section == 1{
            return 60
        }
        else if indexPath.section == 2{
            return 60
        }
        else if indexPath.section == 3{
            return 50
        }
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 20
        }
        else if section == 3 {
            return 10
        }
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 2 {
            return secNum
        }
        return 1
    }

    //禁止下拉
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0{
            var offset = scrollView.contentOffset
            offset.y = 0
            scrollView.contentOffset = offset
        }
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
        else if indexPath.section == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "shopNameCell", for: indexPath)
            let tmpShopName = cell.viewWithTag(1) as! UILabel
            tmpShopName.font = UIFont.boldSystemFont(ofSize: 25)
            tmpShopName.text = finalShop.name
        }
        else if indexPath.section == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
            food.loadData()

            let hpArray = hpFunc()
            let tmpFoodImage = cell.viewWithTag(1) as! UIImageView
            tmpFoodImage.image = UIImage(named: hpArray[indexPath.row].image)
            
            let tempFoodName = cell.viewWithTag(2) as! UILabel
            tempFoodName.text = hpArray[indexPath.row].name
            
            let tempFoodAmount = cell.viewWithTag(3) as! UILabel
            let noZeroImp = imp.filter({ (tmp) -> Bool in
                tmp != "0"
            })
            tempFoodAmount.text = "x" + noZeroImp[indexPath.row]
            
            let tempFoodPrice = cell.viewWithTag(4) as! UILabel
            let a = Float(hpArray[indexPath.row].price) ?? 0, b = Float(noZeroImp[indexPath.row]) ?? 0
            tempFoodPrice.text = "￥" + String(a * b)
        }
        else if indexPath.section == 3{
            cell = tableView.dequeueReusableCell(withIdentifier: "redPackCell", for: indexPath)
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "totalPriceCell", for: indexPath)
            let tmpTotalPrice = cell.viewWithTag(1) as! UILabel
            tmpTotalPrice.font = UIFont.boldSystemFont(ofSize: 20)
            tmpTotalPrice.text = "小计：￥" + TotalPrice
        }
        return cell
    }
    
    //获取已订购商品
    func hpFunc() -> [FoodInfo]{
        let TheOne = food.foodList.filter { (tmp) -> Bool in
            tmp.shopName == finalShop.name
        }
        
        var newOne = [FoodInfo]()
        
        for i in 0..<imp.count{
            if Int(imp[i]) != 0 {
                newOne.append(TheOne[i])
            }
        }
        return newOne
    }
    
}

extension CheckOrderTableViewController{
    @objc func btnClick(sender:UIButton){
        if let testVC = self.storyboard?.instantiateViewController(withIdentifier: "mainStory") {
            
            let date = Date()
            let time = DateFormatter()
            time.dateFormat = "yyyy-MM-dd HH:mm"
            let timeStr = time.string(from: date) as String

            order.loadData()
            order.orderList.append(OrderInfo(shopName: finalShop.name, shopImage: finalShop.shopImage, time: timeStr, price: "￥" + TotalPrice))
            order.saveData()
            
            let vc = testVC as! UITabBarController
            vc.selectedIndex = 2
            vc.modalTransitionStyle = .coverVertical // 选择过渡效果
            self.present(vc, animated: true, completion: nil)
        }
    }
}
