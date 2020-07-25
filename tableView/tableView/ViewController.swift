//
//  ViewController.swift
//  tableView
//
//  Created by kim on 2020/07/25.
//  Copyright © 2020 Skydevilk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //TableView : 테이블로 된 뷰 -> 여러개의 행이 모여있는 뷰(화면)
    
    // 1. 데이터
    
    // 2. 데이터의 개수
    
    // 3. 데이터 행을 클릭으로 늘린다.
    
    @IBOutlet weak var TableViewMain: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터의 개수
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 데이터
        // 1번 방법 - 임의의 셀 만들기
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellTaype1")
        //cell.textLabel?.text="\(indexPath.row + 1)"

        
        // 2번 방법 - 스토리보드 + id
        
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        cell.LabelText.text = "\(indexPath.row+1)"
        
        
        return cell
        
    }
    
    //Click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row + 1)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }
}
