//
//  InfoViewController.swift
//  BullsEye
//
//  Created by Tilek Sulaymanbekov on 6/16/20.
//  Copyright © 2020 Tilek Sulaymanbekov. All rights reserved.
//

import UIKit
import WebKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "Bullseye", withExtension: "html") {
         let request = URLRequest(url: url)
            webView.load(request)
        }
    
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
