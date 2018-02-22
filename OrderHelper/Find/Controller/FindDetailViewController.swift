//
//  FindDetailViewController.swift
//  OrderHelper
//
//  Created by spidepa on 22/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class FindDetailViewController: UIViewController {

    @IBOutlet weak var findDetailLabel: UILabel!
    
    var tmpString: String = "empty"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findDetailLabel.text = self.tmpString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
