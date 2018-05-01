//
//  SearchTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 31/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit
import LeanCloud

class SearchTableViewController: UITableViewController {
    
    var tmpShop = Shop(category:"", name:"", shopLogo: "", deliveryTime: "", minDeliveryPrice: "", amount: "", foodNumber: 0)
    var food = Food()
    var items = [] as Array
    var order = Order()
    var address = Address()

    override func viewDidLoad() {
        super.viewDidLoad()
        onCreateShopNameData()
        onCreateFoodData()
        
        if (UserDefaults.standard.string(forKey: "UserName") != nil){
            onCreateOrderData()
            onCreateAddressData()
        }
        
        let searchResultsController = storyboard?.instantiateViewController(withIdentifier: "searchResults")
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchBar.placeholder = "请输入店铺名或商品名"
        searchController.searchBar.autocapitalizationType = .none

        //实时搜索
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        //默认显示searchbar
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["传统美食", "快餐便当", "小吃零食", "甜品饮品"]
    }
    
    func onCreateShopNameData(){
        let query = LCQuery(className: "Shop")
        query.whereKey("pic", .existed)
        query.find { result in
            switch result {
            case .success(let objects):
                for thisResult in objects{
                    let addThis = thisResult.get("name")?.stringValue
                    self.items.append(addThis as Any)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func onCreateFoodData(){
        let query = LCQuery(className: "FoodInfo")
        query.whereKey("pic", .existed)
        query.find { result in
            switch result {
            case .success(let objects):
                for resultFood in objects{
                    let addThisFood = FoodInfo(  shopName: resultFood.get("shopName")!.stringValue ?? "???",
                                                 name: resultFood.get("name")!.stringValue ?? "???",
                                                 image: resultFood.get("image")!.stringValue ?? "???",
                                                 price: resultFood.get("price")!.stringValue ?? "???")
                    self.food.foodList.append(addThisFood)
                    self.food.saveData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func onCreateOrderData(){
        let query = LCQuery(className: "OrderInfo")
        query.whereKey("user", .equalTo(UserDefaults.standard.string(forKey: "UserName") ?? "???"))
        query.find { result in
            switch result {
            case .success(let objects):
                for thisResult in objects{
                    let addThis = OrderInfo( user: thisResult.get("user")!.stringValue ?? "???",
                                              shopName: thisResult.get("shopName")!.stringValue ?? "???",
                                              shopImage: thisResult.get("shopImage")!.stringValue ?? "???",
                                              time: thisResult.get("time")!.stringValue ?? "???",
                                              price: thisResult.get("price")!.stringValue ?? "???")
                    self.order.orderList.append(addThis)
                    self.order.saveData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func onCreateAddressData(){
        let query = LCQuery(className: "AddressInfo")
        query.whereKey("user", .equalTo(UserDefaults.standard.string(forKey: "UserName") ?? "???"))
        query.find { result in
            switch result {
            case .success(let objects):
                for thisResult in objects{
                    
                    print(thisResult.get("user")!.stringValue ?? "???")
                    
                    let addThis = AddressInfo( user: thisResult.get("user")!.stringValue ?? "???",
                                               name: thisResult.get("name")!.stringValue ?? "???",
                                               phone: thisResult.get("phone")!.stringValue ?? "???",
                                               address: thisResult.get("address")!.stringValue ?? "???",
                                               door: thisResult.get("door")!.stringValue ?? "???")
                    self.address.addressList.append(addThis)
                    self.address.saveData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private var searchResultsController: SearchResultsViewController? {
        return navigationItem.searchController?.searchResultsController as? SearchResultsViewController
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
        return 7
    }
}

// MARK: - UISearchControllerDelegate
extension SearchTableViewController : UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        searchResultsController?.reset()
    }
}

extension SearchTableViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        search(searchController.searchBar.text)
    }
}

// MARK: - helpers
extension SearchTableViewController {
    func search(_ text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        searchResultsController?.search(text, in: items as! [String])
    }
}

