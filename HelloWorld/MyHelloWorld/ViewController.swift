//
//  ViewController.swift
//  HelloWorld
//
//  Created by Pavel Chehov on 4/9/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.title(for: .normal)!
        let text = "\(title) button pressed"
        let styledText = NSMutableAttributedString(string: text)
        let attributes = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)]
        let nameRange = (text as NSString).range(of: title)
        styledText.setAttributes(attributes, range: nameRange)
        statusLabel.attributedText = styledText
    }
}

