//
//  FoodTableViewCell.swift
//  OrderHelper
//
//  Created by spidepa on 16/3/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

typealias jump = (String) ->()

class FoodTableViewCell: UITableViewCell{
    
    var jumpClick: jump?
    
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
        jumpClick!(number.text!)
    }
    
    @IBOutlet weak var number: UILabel!
    @IBAction func plus(_ sender: UIButton) {
        let temp = Int(number.text!)! + 1
        number.text = String(temp)
        number.textColor = UIColor.red
        jumpClick!(number.text!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}


