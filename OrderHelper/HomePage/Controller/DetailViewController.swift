//
//  DetailViewController.swift
//  OrderHelper
//
//  Created by spidepa on 19/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var foodsTableView: UITableView!
    
    @IBOutlet weak var cartFooter: UIView!
    @IBAction func fakeReturnButton(_ sender: UIBarButtonItem) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    var food = Food()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化模拟数据
        onCreateData()
    }
    
    func onCreateData(){
        food.foodList.append(FoodInfo(shopName: "杨国福麻辣烫", name: "经典麻辣烫", image: "MalaTang.jpeg", price: "20￥"))
        food.foodList.append(FoodInfo(shopName: "绝味鸭脖", name: "招牌麻辣鸭脖", image: "SpicyDuckNeck.jpg", price: "31.9￥"))
        food.foodList.append(FoodInfo(shopName: "肯德基", name: "超值全家桶", image: "KFCBucket.jpg", price: "124￥"))
        food.foodList.append(FoodInfo(shopName: "肯德基", name: "香辣鸡腿堡", image: "SpicyChickenFort.jpg", price: "16.5￥"))
        food.foodList.append(FoodInfo(shopName: "肯德基", name: "老北京鸡肉卷", image: "BeijingChickenRoll.jpg", price: "16￥"))
        food.foodList.append(FoodInfo(shopName: "肯德基", name: "百事可乐", image: "Pepsi.jpg", price: "4￥"))
        food.foodList.append(FoodInfo(shopName: "麦当劳", name: "芝士汉堡套餐", image: "CheeseburgerPackage.jpg", price: "34￥"))
        food.foodList.append(FoodInfo(shopName: "麦当劳", name: "巨无霸汉堡", image: "BigMacHamburg.png", price: "17.5￥"))
        food.foodList.append(FoodInfo(shopName: "必胜客", name: "特惠套餐 ", image: "PizzaHutPizza.jpg", price: "79￥"))
        food.foodList.append(FoodInfo(shopName: "必胜客", name: "美食至尊比萨", image: "PizzaHutGourmetSupremePizza.jpg", price: "85￥"))
        food.foodList.append(FoodInfo(shopName: "星巴克", name: "拿铁", image: "StarbucksLatte.jpeg", price: "30￥"))
        food.foodList.append(FoodInfo(shopName: "星巴克", name: "卡布奇诺", image: "StarbucksCappuccino.jpg", price: "33￥"))
        food.foodList.append(FoodInfo(shopName: " 一粥七天", name: "皮蛋瘦肉粥 ", image: "Porridge.jpg", price: "13￥"))
        food.foodList.append(FoodInfo(shopName: "COCO都可", name: "珍珠奶茶", image: "PearlMilkTea.png", price: "11￥"))
        food.foodList.append(FoodInfo(shopName: "蔚甜品", name: "草莓圣代", image: "Sundae.jpg", price: "11.5￥"))
        food.foodList.append(FoodInfo(shopName: "美味餐厅", name: "黄焖鸡米饭  ", image: "ChickenRice.jpeg", price: "15￥"))
        food.foodList.append(FoodInfo(shopName: "滋味烧烤", name: "羊肉串", image: "Kebab.jpg", price: "3￥"))
        food.foodList.append(FoodInfo(shopName: "兰州拉面", name: "牛肉拉面 ", image: "BeefRamen .jpg", price: "16￥"))
        
        food.saveData()
        food.loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodDetailCell", for: indexPath)
        //TODO: - NEED TO FIX!!!
        let zxc = food.foodList.filter { (asd) -> Bool in
            asd.shopName == "肯德基"
        }
        for z in zxc {
            let rewfdsagas = FoodTableViewCell()
            rewfdsagas.TheFood = z
            
            let tempFoodImage = cell.viewWithTag(1) as! UIImageView
            tempFoodImage.image = UIImage(named: z.image)
            
            let tempFoodName = cell.viewWithTag(2) as! UILabel
            tempFoodName.text = z.name
            
            let tempFoodPrice = cell.viewWithTag(3) as! UILabel
            tempFoodPrice.text = z.price
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
