//
//  NameAndColorCell.swift
//  TableCells
//
//  Created by Pavel Chehov on 4/14/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    
    static let cellHeight: CGFloat = 74
    
    var name: String = "" {
        willSet {
            if self.name != newValue {
                nameLabel?.text = newValue
            }
        }
    }
    
    var color: String = "" {
        willSet {
            if self.color != newValue {
                colorLabel?.text = newValue
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
