//
//  ViewController.swift
//  TableCells
//
//  Created by Pavel Chehov on 4/14/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "CellIdentifier"
    let computers = [
        ["Name":"MacBook Air", "Color":"Silver"],
        ["Name":"MacBook Pro", "Color":"Silver"],
        ["Name":"iMac", "Color":"Silver"],
        ["Name":"Mac Mini", "Color":"Silver"],
        ["Name":"Mac Pro", "Color":"Black"],
    ]
    
    
    
    //MARK: - datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NameAndColorCell
        
        let data = computers[indexPath.row]
        cell.name = data["Name"]!
        cell.color = data["Color"]!
        return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NameAndColorCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

