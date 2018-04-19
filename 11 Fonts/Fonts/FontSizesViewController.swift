//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by Pavel Chehov on 4/17/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    var font: UIFont!
    private static let pointSizes: [CGFloat] = [9,10,11,12,13,14,18,24,36,48,64,72,96,144]
    private static let cellIdentifier = "FontNameAndSize"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = font.fontName
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return FontSizesViewController.pointSizes.count
    }
    
    func fontForDisplay(indexPath: IndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return self.font.withSize(pointSize)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontSizesViewController.cellIdentifier, for: indexPath)
        cell.textLabel!.font = fontForDisplay(indexPath: indexPath)
        cell.textLabel!.text = font.fontName
        cell.detailTextLabel!.text = "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        return cell
    }
    
   
}
