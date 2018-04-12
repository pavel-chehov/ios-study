//
//  ViewController.swift
//  Restructure
//
//  Created by Pavel Chehov on 4/11/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask(rawValue: (UIInterfaceOrientationMask.portrait.rawValue | UIInterfaceOrientationMask.landscape.rawValue))
    }

}

