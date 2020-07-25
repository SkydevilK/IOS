//
//  ViewController.swift
//  HelloWorld
//
//  Created by kim on 2020/07/25.
//  Copyright © 2020 Skydevilk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Click_moveButton(_ sender: Any) {
        //storyboard find controller : DetailController
        
        // Optional Binding
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController"){
            //push controller = navi
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
