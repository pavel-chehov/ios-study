//
//  NameAndColorCell.swift
//  TableCells
//
//  Created by Pavel Chehov on 4/14/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    var nameLabel: UILabel!
    var colorLabel: UILabel!
    
    var name: String = "" {
        willSet {
            if self.name != newValue {
                nameLabel.text = newValue
            }
        }
    }
    
    var color: String = "" {
        willSet {
            if self.color != newValue {
                colorLabel.text = newValue
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let nameLabelRect = CGRect(x: 0, y: 5, width: 70, height: 15)
        let nameMarker = UILabel(frame: nameLabelRect)
        nameMarker.textAlignment = .right
        nameMarker.text = "Name"
        nameMarker.font = UIFont.boldSystemFont(ofSize: 12)
        contentView.addSubview(nameMarker)
        
        let colorLabelRect = CGRect(x: 0, y: 26, width: 70, height: 15)
        let colorMarker = UILabel(frame: colorLabelRect)
        colorMarker.textAlignment = .right
        colorMarker.text = "Color"
        colorMarker.font = UIFont.boldSystemFont(ofSize: 12)
        contentView.addSubview(colorMarker)
        
        let nameValueRect = CGRect(x: 80, y: 5, width: 200, height: 15)
        nameLabel = UILabel(frame: nameValueRect)
        contentView.addSubview(nameLabel)
        
        let colorValueRect = CGRect(x: 80, y: 25, width: 200, height: 15)
        colorLabel = UILabel(frame: colorValueRect)
        contentView.addSubview(colorLabel)
    }
}
