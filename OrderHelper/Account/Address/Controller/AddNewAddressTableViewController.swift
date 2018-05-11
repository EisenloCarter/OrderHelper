//
//  AddNewAddressTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 26/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit
import LeanCloud

class AddNewAddressTableViewController: UITableViewController {
    
    var address = Address()
    let logPro = LoginProfile()
    var emp = "???"
    
    @IBOutlet weak var txfName: UITextField!
    @IBOutlet weak var txfPhone: UITextField!
    @IBOutlet weak var txfAddress: UITextField!
    @IBOutlet weak var txfDoor: UITextField!
    @IBAction func btnDone(_ sender: UIBarButtonItem) {
        if txfName.hasText && txfPhone.hasText && txfAddress.hasText && txfDoor.hasText{
            if logPro.isPhoneNumber(phone: txfPhone.text ?? ""){
                
                address.loadData()
                address.addressList.append(AddressInfo(name: txfName.text ?? emp,phone: txfPhone.text ?? emp , address: txfAddress.text ?? emp , door: txfDoor.text ?? emp))
                address.saveData()
                
                let newAddress = LCObject(className: "AddressInfo")
                newAddress.set("user", value: UserDefaults.standard.string(forKey: "UserName") ?? "???")
                newAddress.set("name", value: txfName.text ?? emp)
                newAddress.set("phone", value: txfPhone.text ?? emp)
                newAddress.set("address", value: txfAddress.text ?? emp)
                newAddress.set("door", value: txfDoor.text ?? emp)
                newAddress.save(){ result in
                    switch result {
                    case .success:
                        print("地址保存成功！")
                        break
                    case .failure(let error):
                        print(error)
                    }
                }
                
                let alertController = UIAlertController(title: "系统提示",
                                                        message: "收货地址已成功保存",
                                                        preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                    action in
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                let alertController = UIAlertController(title: "系统提示",
                                                        message: "请您输入正确的手机号码",
                                                        preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                    action in
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        else{
            let alertController = UIAlertController(title: "系统提示",
                                                    message: "请您填写完整信息",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 4
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
