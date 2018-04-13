//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Pavel Chehov on 4/12/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        datePicker.setDate(date, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSelectButtonPressed(_ sender: UIButton) {
        let date = datePicker.date
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
//        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        let message = "The date and time you selected is \(formatter.string(from: date))"
        let alert = UIAlertController(title: "Date and time selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "So true", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
