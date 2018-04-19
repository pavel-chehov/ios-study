//
//  FontListViewController.swift
//  Fonts
//
//  Created by Pavel Chehov on 4/17/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class FontListViewController: UITableViewController {
    var fontNames: [String] = []
    var showsFavorites: Bool = false
    private var fontPointSize: CGFloat!
    private static let cellIdentifier = "FontName"

    override func viewDidLoad() {
        super.viewDidLoad()
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: .headline)
        fontPointSize = preferredTableViewFont.pointSize
        //by default it was AutomaticDemension, and we could comment next line
        tableView.estimatedRowHeight = fontPointSize
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if showsFavorites {
            fontNames = FavoritesList.sharedFavoritesList.favorites
            navigationItem.rightBarButtonItem = self.editButtonItem
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }

    func fontForDisplay(indexPath: IndexPath) -> UIFont {
        let fontName = fontNames[indexPath.row]
        return UIFont(name: fontName, size: fontPointSize)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontListViewController.cellIdentifier, for: indexPath)
        cell.textLabel!.font = fontForDisplay(indexPath: indexPath)
        cell.textLabel!.text = fontNames[indexPath.row]
        cell.detailTextLabel!.text = fontNames[indexPath.row]
        return cell
    }
    
    //editing logic
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //delete action will be set automatically
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if(!showsFavorites) {
            let addtoFavoriteAction = UITableViewRowAction(style: .default, title: "To Favorites", handler:{action, indexPath in
                let font = self.fontNames[indexPath.row]
                FavoritesList.sharedFavoritesList.addFavorite(fontName: font)
                var alert = UIAlertController(title: "Success!", message: "Font was added to the favorites list", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
            addtoFavoriteAction.backgroundColor = UIColor.green
            return [addtoFavoriteAction]
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favorite = fontNames[indexPath.row]
            FavoritesList.sharedFavoritesList.removeFavorite(fontName: favorite)
            fontNames = FavoritesList.sharedFavoritesList.favorites
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        FavoritesList.sharedFavoritesList.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        fontNames = FavoritesList.sharedFavoritesList.favorites
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let font = fontForDisplay(indexPath: indexPath)
        
        if segue.identifier == "showFontSizes" {
            let sizesVC = segue.destination as! FontSizesViewController
            sizesVC.font = font;
        } else {
            let infoVC = segue.destination as! FontInfoViewController
            infoVC.font = font
            infoVC.isFavorite = FavoritesList.sharedFavoritesList.favorites.contains(font.fontName)
        }
    }
}
