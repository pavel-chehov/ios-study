//
//  SearchResultTableViewController.swift
//  TableSections
//
//  Created by Pavel Chehov on 4/15/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UITableViewController, UISearchResultsUpdating {
    private static let longNameSize = 6
    private static let shortNameButtonIndex = 1
    private static let longNameButtonIndex = 2
    
    let tableIdentifier = "SectionsTableIdentifier"
    
    var names: [String: [String]] = [String: [String]]()
    var keys: [String] = [String]()
    var filteredNames: [String] = []
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text {
            let buttonIndex = searchController.searchBar.selectedScopeButtonIndex
            filteredNames.removeAll(keepingCapacity: true)
            
            if !searchString.isEmpty {
                //filtered closure for long and short names
                let filterClosure: (String) -> Bool = {
                    name in
                    let nameLenght = name.characters.count
                    if (buttonIndex == SearchResultTableViewController.shortNameButtonIndex && nameLenght >= SearchResultTableViewController.longNameSize) ||
                        (buttonIndex == SearchResultTableViewController.longNameButtonIndex && nameLenght < SearchResultTableViewController.longNameSize) {
                                return false
                    }
                    
                    let range = name.range(of: searchString, options: .caseInsensitive, range: nil, locale: nil)
                    return range != nil
                }
                
                for key in keys {
                    let namesForKey = names[key]!
                    let mathces = namesForKey.filter(filterClosure)
                    filteredNames.append(contentsOf: mathces)
                }
            }
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier, for: indexPath)
        cell.textLabel?.text = filteredNames[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableIdentifier)
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
        return filteredNames.count
    }
}
