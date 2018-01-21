//
//  SettingTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 19/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController{
    @IBAction func logOutButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: 各个cell的触发事件
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if (indexPath.section == 0) {
            switch indexPath.row {
            //头像
            case 0:
                let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                let takePhotos = UIAlertAction(title: "拍照", style: .default, handler: {
                    (action: UIAlertAction) -> Void in
                    //判断是否能进行拍照，可以的话打开相机
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        let picker = UIImagePickerController()
                        picker.sourceType = .camera
                        picker.delegate = self
                        picker.allowsEditing = true
                        self.present(picker, animated: true, completion: nil)
                    }
                    else
                    {
                        let cameraAlert = UIAlertController(title: "警告", message: "请检查相机权限", preferredStyle: .alert)
                        self.present(cameraAlert, animated: true, completion: nil)
                        print("相机打开失败");
                    }
                    
                })
                let selectPhotos = UIAlertAction(title: "从相册选取", style: .default, handler: {
                    (action:UIAlertAction)
                    -> Void in
                    //调用相册功能，打开相册
                    let picker = UIImagePickerController()
                    picker.sourceType = .photoLibrary
                    picker.delegate = self
                    picker.allowsEditing = true
                    self.present(picker, animated: true, completion: nil)
                    
                })
                actionSheet.addAction(cancelBtn)
                actionSheet.addAction(takePhotos)
                actionSheet.addAction(selectPhotos)
                self.present(actionSheet, animated: true, completion: nil)
                print("点击头像cell")
            //用户名
            case 1:
                print("11111")
            //绑定手机
            case 2:
                print("22222")
            default:
                break
            }
        }
        
        else if (indexPath.section == 1) {
            switch indexPath.row {
            //登录密码
            case 0:
                print("33333")
            //支付密码
            case 1:
                print("44444")
            default:
                break
            }
        }
        
        else if (indexPath.section == 2) {
            switch indexPath.row {
            //关于
            case 0:
                print("55555")
            default:
                break
            }
        }
        print("选中了第\(indexPath.row)个cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SettingTableViewController: UIImagePickerControllerDelegate {
    // 用户选取图片之后
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 参数 UIImagePickerControllerOriginalImage 代表选取原图片，这里使用 UIImagePickerControllerEditedImage 代表选取的是经过用户拉伸后的图片。
        if (info[UIImagePickerControllerEditedImage] as? UIImage) != nil {
            // 这里对选取的图片进行你需要的操作，通常会调整 ContentMode。
        }
        // 必须写这行，否则拍照后点击重新拍摄或使用时没有返回效果。
        picker.dismiss(animated: true, completion: nil)
    }
}

extension SettingTableViewController: UINavigationControllerDelegate {
    // 这里可以什么都不写
}

