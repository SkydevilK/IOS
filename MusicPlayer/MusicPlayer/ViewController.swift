//
//  ViewController.swift
//  MusicPlayer
//
//  Created by kim on 2020/07/21.
//  Copyright © 2020 Skydevilk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var playPauseButton : UIButton!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var progressSlider : UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        print("button tapped")
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("silder value changed")
    }
}
