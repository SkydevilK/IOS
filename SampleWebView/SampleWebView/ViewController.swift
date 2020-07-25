//
//  ViewController.swift
//  SampleWebView
//
//  Created by kim on 2020/07/25.
//  Copyright © 2020 Skydevilk. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 1. url string
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString){
            //unwrap
            // 2. url > request
            let urlRequest = URLRequest(url: url)

            // 3. ruquest > load
            WebViewMain.load(urlRequest)
        }
        
    }

    
}

