//
//  ContentCell.swift
//  DialogViewer
//
//  Created by Pavel Chehov on 4/22/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    var label: UILabel!
    var maxWidth: CGFloat!
    
    var text : String! {
        get {
            return label.text
        }
        set {
            label.text = newValue
            var newLabelFrame = label.frame
            var newContentFrame = contentView.frame
            let textSize = type(of: self).sizeForContentString(str: newValue, maxWidth: maxWidth)
            newLabelFrame.size = textSize
            newContentFrame.size = textSize
            label.frame = newLabelFrame
            contentView.frame = newContentFrame
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: self.contentView.bounds)
        label.isOpaque = false
        label.backgroundColor = UIColor.lightGray
        label.textAlignment = .center
        //if we try call ContentCell.defaultfont(), we always call implementation from
        //the ContentCell class.
        //But we want call overrided implementation from the HeaderCell class
        //and we will call type(of: self), this will call implementation on the current class
        label.font = type(of: self).defaultFont()
        contentView.addSubview(label)
    }
    
    //I can call method like static, with accessing on the class level
    //but I can override this method in child classes
    //this is the main difference between class func and static func
    //I cant override static functions in child classes
    class func sizeForContentString (str: String, maxWidth: CGFloat) -> CGSize {
        let maxSize = CGSize(width: maxWidth, height: 1000)
        let drawingOptions = NSStringDrawingOptions.usesLineFragmentOrigin
        let paragraphStylele = NSMutableParagraphStyle()
        paragraphStylele.lineBreakMode = .byCharWrapping
        let textAttrs = [ NSAttributedStringKey.font: defaultFont(), NSAttributedStringKey.paragraphStyle: paragraphStylele]
        let string = str as NSString
        let rect = string.boundingRect(with: maxSize, options: drawingOptions, attributes: textAttrs, context: nil)
        return rect.size
    }
    
    class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: .body)
    }
}
