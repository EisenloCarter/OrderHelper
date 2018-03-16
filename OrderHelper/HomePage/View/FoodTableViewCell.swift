//
//  FoodTableViewCell.swift
//  OrderHelper
//
//  Created by spidepa on 16/3/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    var TheFood = FoodInfo()
    
    //    @IBOutlet weak var foodImage: UIImageView!{
    //        didSet{
    //            foodImage.image = UIImage(named: TheFood.image)
    //        }
    //    }
//    @IBOutlet weak var foodName: UILabel!{
//        didSet{
//            foodName.text = TheFood.name
//        }
//    }
//    @IBOutlet weak var foodPrice: UILabel!{
//        didSet{
//            foodPrice.text = TheFood.price
//        }
//    }
    @IBAction func minus(_ sender: UIButton) {
        var temp = Int(number.text!)!
        if temp > 1 {
            temp -= 1
            number.text = String(temp)
        }
        else{
            number.text = "0"
            number.textColor = UIColor.black
        }
    }
    @IBOutlet weak var number: UILabel!
    @IBAction func plus(_ sender: UIButton) {
        let temp = Int(number.text!)! + 1
        number.text = String(temp)
        number.textColor = UIColor.red
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

