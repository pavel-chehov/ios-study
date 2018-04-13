//
//  CustomPickerViewController.swift
//  Pickers
//
//  Created by Pavel Chehov on 4/12/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    
    private var winSoundId: SystemSoundID = 0
    private var crunchSoundId: SystemSoundID = 0
    private var images: [UIImage]!
    
    //datasource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    //delegate methods
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        images = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!,
        ]
        winLabel.text = " " //whitespace determines correct label height
        arc4random_stir() //sets first value for random generator
    }
    
    @IBAction func onSpinButtonPressed(_ sender: UIButton) {
        spinButton.isEnabled = false
        var isWin = false
        var numInRow = -1
        var lastVal = -1

        for i in 0...4 {
            let randomValue = Int(arc4random_uniform(UInt32(images.count)))
            if randomValue == lastVal {
                numInRow+=1
            } else {
                numInRow = 1
            }
            lastVal = randomValue
            
            picker.selectRow(randomValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            
            if numInRow >= 3 {
                isWin = true
            }
        }
        if crunchSoundId == 0 {
            let soundUrl = Bundle.main.url(forResource: "crunch", withExtension: "wav")
            AudioServicesCreateSystemSoundID(soundUrl! as CFURL, &crunchSoundId)
        }
        AudioServicesPlaySystemSound(crunchSoundId)
        if isWin {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: self.playWinSound)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.spinButton.isEnabled = true;
            }
        }
        self.winLabel.text = " "
    }
    
    func playWinSound() {
        if winSoundId == 0 {
            let soundUrl = Bundle.main.url(forResource: "win", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundUrl, &winSoundId)
        }
        AudioServicesPlaySystemSound(winSoundId)
        winLabel.text = "WINNER!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.spinButton.isEnabled = true
        }
    }
}
