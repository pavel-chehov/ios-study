//
//  ViewController.swift
//  SimpleTable
//
//  Created by Pavel Chehov on 4/14/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let dwarves = ["Sleepy", "Sneezy", "Bashful", "Happy", "Doc", "Grumpy",
                           "Thorin", "Dorin", "Bombur", "Bifur", "Kili", "Fili",
                           "Oin", "Gloin", "Bofur", "Bombur", "Dwalin", "Balin", "Kostya"]
    let tableIdentifier = "SimpleTableIdentifier"
    
    //datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: tableIdentifier)
        }
        
        //we must choose .subtitle style for cell, otherwise we will get an error
        cell!.detailTextLabel?.text = indexPath.row < 7 ? "Disney" : "Tolkien"
        cell!.textLabel?.text = dwarves[indexPath.row]
        cell!.imageView?.image = UIImage(named: "star")
        cell!.imageView?.highlightedImage = UIImage(named: "star2");
        
        cell!.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        
        return cell!
    }
    
    //MARK: - delegate methods
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dwarve = dwarves[indexPath.row]
        let message = "You've selected \(dwarve)"
        let controller = UIAlertController(title: "Row selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

