//
//  DetailViewController.swift
//  Presidents
//
//  Created by Pavel Chehov on 5/1/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail["url"]
                self.title = detail["name"]
                
                let url = NSURL(string: detail["url"]!)!
                let request = URLRequest(url: url as URL)
                webView.load(request)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: [String:String]? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}

