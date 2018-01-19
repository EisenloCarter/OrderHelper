//
//  ViewController.swift
//  OrderHelper
//
//  Created by spidepa on 4/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit
import LeanCloud

class LoginViewController: UITableViewController {
    //验证码
    var safeNum = ""
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var safeCodeTextField: UITextField!
    
    //判断是否是手机号
    @IBAction func getSafeNumButton(_ sender: UIButton) {
        let profile = LoginProfile()
        if (profile.isPhoneNumber(phone: phoneNumTextField.text!)) {
            print("Phone number correct!")
            
            //随机生成四位整数验证码
            safeNum = ""
            for _ in 0...3 {
                let randomNum = "\(Int(arc4random() % 10))"
                safeNum.append(randomNum)
            }
            print("safeNum:",safeNum)
            safeCodeTextField.text = safeNum
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
    
    //判断验证码是否与手机号匹配
    @IBAction func loginButton(_ sender: UIButton) {
        let profile = LoginProfile()
        if ((safeCodeTextField.text == safeNum) && profile.isPhoneNumber(phone: phoneNumTextField.text!)) {
            print("All correct!")
            
            //LeanCode登录/注册
            LCUser.logIn(username: phoneNumTextField.text!, password: phoneNumTextField.text!) { result in
                switch result {
                case .success( _):
                    print("登录成功！")
                    self.navigationController?.popViewController(animated: true)
                    break
                case .failure(let error):
                    let newUser = LCUser()
                    newUser.username = LCString(self.phoneNumTextField.text!)
                    newUser.password = LCString(self.phoneNumTextField.text!)
                    //MARK: 登录后用户操作
                    newUser.signUp()
                    print("登录失败：",error)
                    
                    //MARK: 登录失败则不进行界面跳转（由于LeanCode问题，很容易登录超时失败）
                    let alertController = UIAlertController(title: "系统提示",
                                                            message: "请您重新登录",
                                                            preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                        action in
                        print("重新登录：用户点击了确定")
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
                print("登录：用户点击了确定")
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

