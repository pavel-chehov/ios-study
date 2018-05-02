//
//  ViewController.swift
//  ControlFun
//
//  Created by Pavel Chehov on 4/10/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var somethingButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "\(Int(slider.value))"
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func fieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func onTapGestureRecognizer(_ sender: Any) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"
    }
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let state = sender.isOn
        leftSwitch.setOn(state, animated: true)
        rightSwitch.setOn(state, animated: true)
    }
    @IBAction func onSegmentedControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            somethingButton.isHidden = true
        case 1:
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            somethingButton.isHidden = false
        default:
            break
        }
    }
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are you sure", message: nil, preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
            //обработчик нажатия кнопки YES
            let msg = self.nameField.text!.isEmpty ? "all is OK" : "all is ok, \(self.nameField.text!)"
            let controller2 = UIAlertController(title: "Something was done", message: msg, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Phew", style: .cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.present(controller2, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        //показывает стрелочку над кнопкой вызвавшей popver(всплывающее окно)
        //работает только на ipad, если не добавить то упадет
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
        }
        
        present(controller, animated: true, completion: nil)
    }
}

