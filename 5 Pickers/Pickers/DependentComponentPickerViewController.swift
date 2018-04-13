//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Pavel Chehov on 4/12/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let stateComponent = 0
    let zipComponent = 1
    private var stateZips: [String: [String]]!
    private var states: [String]!
    private var zips: [String]!
    
    @IBOutlet weak var dependPicker: UIPickerView!
    
    //MARK: - datasource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == stateComponent ? states.count :
        zips.count
    }
    
    //MARK: - delegate's methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == stateComponent ? states[row] : zips[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependPicker.reloadComponent(zipComponent)
            dependPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        let plistUrl = bundle.url(forResource: "statedictionary", withExtension: "plist")
        
        stateZips = NSDictionary.init(contentsOf: plistUrl!) as! [String : [String]]
        states = stateZips.keys.sorted()
        zips = stateZips[states[0]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onSelectButtonPressed(_ sender: UIButton) {
        let stateRow = dependPicker.selectedRow(inComponent: stateComponent)
        let zipRow = dependPicker.selectedRow(inComponent: zipComponent)
        let state = states[stateRow]
        let zip = zips[zipRow]
        let title = "You selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
