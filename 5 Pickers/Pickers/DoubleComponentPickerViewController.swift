//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by Pavel Chehov on 4/12/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var doublePicker: UIPickerView!
    
    private let fillingComponent = 0
    private let breadComponent = 1
    
    private let fillingTypes = ["Ham", "Turkey","Butter","Roast beef", "Chicken salad", "Vegemite"]
    private let breadTypes = ["White", "Black", "Seven grain", "Rye", "Sourdough"]
    
    //MARK: - datasource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case fillingComponent:
            return fillingTypes.count
        case breadComponent:
            return breadTypes.count
        default:
            return 0
        }
    }
    
    //MARK: - delegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == fillingComponent ?
        fillingTypes[row] : breadTypes[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onSelectButtonPressed(_ sender: UIButton) {
        let fillingTypeRow = doublePicker.selectedRow(inComponent: fillingComponent)
        let breadTypeRow = doublePicker.selectedRow(inComponent: breadComponent)
        
        let message = "You've selected \(breadTypes[breadTypeRow]) and \(fillingTypes[fillingTypeRow])"
        let alert = UIAlertController(title: "Thank you for the choosing", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
