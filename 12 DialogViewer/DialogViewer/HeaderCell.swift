//
//  HeaderCell.swift
//  DialogViewer
//
//  Created by Pavel Chehov on 4/22/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class HeaderCell: ContentCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.8, alpha: 1.0)
        label.textColor = UIColor.black
    }
    
    override class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: .headline)
    }
}
