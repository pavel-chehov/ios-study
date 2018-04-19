//
//  ViewController.swift
//  TableSections
//
//  Created by Pavel Chehov on 4/15/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let tableIdentifier = "SectionsTableIdentifier"
    var names: [String: [String]]!
    var keys: [String]!
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    
    //MARK: - tableview datasource methods
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let namesInSection = names[key];
        return namesInSection!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier, for: indexPath)
        let name = names[keys[indexPath.section]]![indexPath.row]
        cell.textLabel?.text = name
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableIdentifier)
        let path = Bundle.main.path(forResource: "sortednames", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        names = dict as! Dictionary<String, Array<String>>
        keys = (dict!.allKeys as! Array<String>).sorted()
        
        let resultsController = SearchResultTableViewController()
        resultsController.names = self.names
        resultsController.keys = self.keys
        
        searchController = UISearchController(searchResultsController: resultsController);
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles=["All", "Short", "Long"]
        searchBar.placeholder = "Enter the search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultsController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

