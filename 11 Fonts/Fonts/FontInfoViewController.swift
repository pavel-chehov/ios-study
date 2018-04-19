//
//  FintInfoViewController.swift
//  Fonts
//
//  Created by Pavel Chehov on 4/19/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    var font: UIFont!
    var isFavorite = false
    
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = font.fontName
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlМmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789"
        fontSampleLabel.font = font
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.isOn = isFavorite;
    }
    @IBAction func slideFontSize(_ sender: UISlider) {
        let newSize = CGFloat(sender.value)
        fontSampleLabel.font = self.font.withSize(newSize)
        fontSizeLabel.text="\(Int(sender.value))"
    }
    
    @IBAction func toggleFavorite(_ sender: UISwitch) {
        if sender.isOn {
            FavoritesList.sharedFavoritesList.addFavorite(fontName: font.fontName)
        } else {
            FavoritesList.sharedFavoritesList.removeFavorite(fontName: font.fontName)
        }
    }
    
}
