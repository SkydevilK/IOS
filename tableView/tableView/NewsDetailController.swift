//
//  NewsDetailController.swift
//  tableView
//
//  Created by kim on 2020/07/25.
//  Copyright © 2020 Skydevilk. All rights reserved.
//

import UIKit

class NewsDetailController : UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    // 1. Image Url
    var imageUrl: String?
    // 2. desc
    var desc : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = imageUrl {
            // 이미지 가져오기
            // Data
            if let data = try? Data(contentsOf: URL(string : img)!){
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        
        if let d = desc{
            // 본문을 보여준다
            self.LabelMain.text = d
        }
        
    }
}
