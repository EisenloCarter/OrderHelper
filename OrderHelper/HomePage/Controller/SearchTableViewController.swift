//
//  SearchTableViewController.swift
//  OrderHelper
//
//  Created by spidepa on 31/1/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    private let items = [
        "Jon Snow",
        "Bran",
        "Theon",
        "Tarly",
        "Tyrion",
        "Tywin",
        "Jaime",
        "Cersei",
        "Ned",
        "Robb",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        searchController.searchBar.scopeButtonTitles = ["全部", "距离最近", "好评优先", "配送最快"]
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
        return 6
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
        searchResultsController?.search(text, in: items)
    }
}
