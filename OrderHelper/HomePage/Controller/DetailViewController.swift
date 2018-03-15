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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        cartFooter.setNotFiltering()
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodDetailCell", for: indexPath)
//        cell.textLabel?.text = "Just for test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the cart footer
//        foodsTableView.tableFooterView = cartFooter
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
