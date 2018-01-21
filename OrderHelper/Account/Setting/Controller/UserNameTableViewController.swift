//
//  UserNameTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 21/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit
import LeanCloud

class UserNameTableViewController: UITableViewController {
    //验证码
    var safeNum = ""
    
    @IBOutlet weak var getNewPhoneNumberTextField: UITextField!
    @IBOutlet weak var getNewSafeCodeTextField: UITextField!
    
    @IBAction func getNewSafeCodeButton(_ sender: UIButton) {
        let profile = LoginProfile()
        if (profile.isPhoneNumber(phone: getNewPhoneNumberTextField.text!)) {
            print("Phone number correct!")
            //随机生成四位整数验证码
            getNewSafeCodeTextField.text = profile.generateSafeNum()
            safeNum = getNewSafeCodeTextField.text!
            
        }
        else{
            let alertController = UIAlertController(title: "系统提示",
                                                    message: "请您正确输入手机号码",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
                print("获取验证码：用户点击了确定")
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func confirmBondButton(_ sender: UIButton) {
        let profile = LoginProfile()
        if ((getNewSafeCodeTextField.text == safeNum) && profile.isPhoneNumber(phone: getNewPhoneNumberTextField.text!)) {
            print("All correct!")
            
            // MARK: 添加活动指示器
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            view.addSubview(activityIndicator)
            activityIndicator.center = view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            
            //LeanCode登录/注册
            LCUser.logIn(username: getNewPhoneNumberTextField.text!, password: getNewPhoneNumberTextField.text!) { result in
                switch result {
                case .success( _):
                    print("登录成功！")
                    activityIndicator.removeFromSuperview()
                    self.navigationController?.popViewController(animated: true)
                    break
                case .failure(let error):
                    let newUser = LCUser()
                    newUser.username = LCString(self.getNewPhoneNumberTextField.text!)
                    newUser.password = LCString(self.getNewPhoneNumberTextField.text!)
                    //MARK: 登录后用户操作
                    newUser.signUp()
                    print("绑定失败：",error)
                    activityIndicator.removeFromSuperview()
                    
                    //MARK: 登录失败则不进行界面跳转（由于LeanCode问题，很容易登录超时失败）
                    let alertController = UIAlertController(title: "系统提示",
                                                            message: "请您重新绑定",
                                                            preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                        action in
                        print("重新绑定：用户点击了确定")
                    })
                    let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {
                        action in
                        print("取消：用户点击了取消")
                    })
                    alertController.addAction(okAction)
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        else{
            let alertController = UIAlertController(title: "系统提示",
                                                    message: "请您正确输入手机号码与验证码",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
                print("绑定：用户点击了绑定")
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
