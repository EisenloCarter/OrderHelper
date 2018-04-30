//
//  DetailViewController.swift
//  OrderHelper
//
//  Created by spidepa on 19/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit
import LeanCloud

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var nv: UINavigationItem!
    @IBOutlet weak var foodsTableView: UITableView!
    @IBOutlet weak var cartFooter: UIView!
    @IBAction func fakeReturnButton(_ sender: UIBarButtonItem) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var btnHaveTheBill: UIButton!{
        didSet{
            btnHaveTheBill.isUserInteractionEnabled = false
        }
    }
    
    var tmpShop = Shop(category:"", name:"", shopLogo: "", deliveryTime: "", minDeliveryPrice: "", amount: "", foodNumber: 0)
    var food = Food()
    var TotalPrice = ""
    
    override func viewWillAppear(_ animated: Bool) {
//        onCreateData()
        food.loadData()
        print("测试位置:food.foodList.count",food.foodList.count)
        foodsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Helvetica-Bold", size: 25.0)!, NSAttributedStringKey.foregroundColor: UIColor.white]

        nv.title = tmpShop.name
        nv.largeTitleDisplayMode = .automatic
    }
    
//    func onCreateData(){
//        let query = LCQuery(className: "FoodInfo")
//        query.whereKey("shopName", .equalTo(tmpShop.name))
//        query.find { result in
//            switch result {
//            case .success(let objects):
//                for resultFood in objects{
//
//                    print("测试位置1",resultFood.get("name")!.stringValue ?? "???")
//
//                    let addThisFood = FoodInfo(  shopName: resultFood.get("shopName")!.stringValue ?? "???",
//                                                name: resultFood.get("name")!.stringValue ?? "???",
//                                                image: resultFood.get("image")!.stringValue ?? "???",
//                                                price: resultFood.get("price")!.stringValue ?? "???")
//                    self.food.foodList.append(addThisFood)
//                    self.food.saveData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//        food.loadData()
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmpShop.foodNumber
    }
    
    lazy var imp = [String](repeating: "0", count: tmpShop.foodNumber)
    lazy var foodPrice = [String ](repeating: "0", count: tmpShop.foodNumber)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodDetailCell", for: indexPath) as! FoodTableViewCell
        //展示所选店铺的餐品
        
        food.loadData()
        
        let TheOne = food.foodList.filter { (tmp) -> Bool in
            tmp.shopName == tmpShop.name
        }
        
        let tempFoodImage = cell.viewWithTag(1) as! UIImageView
        tempFoodImage.image = UIImage(named: TheOne[indexPath.row].image)
        
        let tempFoodName = cell.viewWithTag(2) as! UILabel
        tempFoodName.text = TheOne[indexPath.row].name
        
        let tempFoodPrice = cell.viewWithTag(3) as! UILabel
        tempFoodPrice.text = "￥" + TheOne[indexPath.row].price
        
        foodPrice[indexPath.row] = TheOne[indexPath.row].price
        
        cell.jumpClick = {(param) ->() in
            //设置已选商品数量数组
            self.imp[indexPath.row] = param
            //计算总价
            var sumPrice :Float = 0
            for i in 0..<self.imp.count{
                sumPrice += Float(self.imp[i])! * Float(self.foodPrice[i])!
            }
            //设置结算按钮状态
            if sumPrice == 0 {
                self.btnHaveTheBill.isUserInteractionEnabled = false
                self.btnHaveTheBill.alpha = 0.4
            }
            else{
                self.btnHaveTheBill.isUserInteractionEnabled = true
                self.btnHaveTheBill.alpha = 1
            }
            self.TotalPrice = String(sumPrice)
            self.priceLabel.text = "总价：￥" + String(sumPrice)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DVCtoCOVC"{
            let controller = segue.destination as! CheckOrderTableViewController
            controller.finalShop = tmpShop
            controller.imp = imp
            controller.TotalPrice = TotalPrice
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

