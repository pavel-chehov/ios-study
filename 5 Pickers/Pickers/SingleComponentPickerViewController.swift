//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by Pavel Chehov on 4/12/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

//this class implements viewcontoller's logic, picker's datasource and delegate logic
class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var singlePicker: UIPickerView!
    
    private let characterNames = ["Luke", "Leia", "Han", "Chewbacca", "Artoo", "Threepio", "Lando"]
    
    //MARK: - Picker's datasource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    //MARK: - Picker's delegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSelectButtonPressed(_ sender: UIButton) {
        let rowNumber = singlePicker.selectedRow(inComponent: 0)
        let selectedName = characterNames[rowNumber]
        let title = "You selected \(selectedName) !"
        
        let alert = UIAlertController(title: title, message: "Than you for choosing", preferredStyle: .alert)
        let action = UIAlertAction(title: "You're welocme", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


