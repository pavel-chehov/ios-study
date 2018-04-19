//
//  RootViewController.swift
//  Fonts
//
//  Created by Pavel Chehov on 4/17/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    private var familyNames: [String]!
    private var cellPointsize: CGFloat!
    private var favoritesList: FavoritesList!
    private static let familyCellIdentifier = "FamilyName"
    private static let favoritesCellIdentifier = "Favorites"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyNames = (UIFont.familyNames as [String]).sorted()
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: .headline)
        cellPointsize = preferredTableViewFont.pointSize
        favoritesList = FavoritesList.sharedFavoritesList
        tableView.estimatedRowHeight = cellPointsize
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func fontFordisplay(indexPath: IndexPath) -> UIFont? {
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNames(forFamilyName: familyName).first
            return fontName != nil ? UIFont(name: fontName!, size: cellPointsize) :
            nil
        }
        return nil
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return favoritesList.favorites.isEmpty ? 1 : 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorite Fonts"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.familyCellIdentifier, for: indexPath)
            cell.textLabel!.font = fontFordisplay(indexPath: indexPath)
            cell.textLabel!.text = familyNames[indexPath.row]
            cell.detailTextLabel!.text = familyNames[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.favoritesCellIdentifier, for: indexPath)
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //recieves new viewcontroller by segue.destination
        //send selected object to the new viewcontroller
        let listVC = segue.destination as! FontListViewController
        
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            listVC.fontNames = (UIFont.fontNames(forFamilyName: familyName) as [String]).sorted()
            listVC.navigationItem.title = familyName
            listVC.showsFavorites = false
        } else {
            listVC.showsFavorites = true
            listVC.navigationItem.title = "Favorites"
        }
    }
}
