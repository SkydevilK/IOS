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
    
    // 1. http 통신 방법 - urlSession
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary<String,Any>>?
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "http://newsapi.org/v2/top-headlines?country=kr&category=technology&apiKey=")!) { (data, response, error) in
            if let dataJson = data {
                // json parsing
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData() // Main
                    }
                }
                catch{}
            }
        }
        
        task.resume()
    }
    // 2. JSON 데이터 형태
    // 3. TableView 매칭 <- 통보 후 그리기
    // BackGround에서 네트워크 작업을 한다.
    // UI는 Main
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터의 개수
        if let news = newsData {
            return news.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 데이터
        // 1번 방법 - 임의의 셀 만들기
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellTaype1")
        //cell.textLabel?.text="\(indexPath.row + 1)"
        
        
        // 2번 방법 - 스토리보드 + id
        
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        let idx = indexPath.row
        if let news = newsData {
            let row = news[idx]
            if let r = row as? Dictionary<String, Any>{
                if let title = r["title"] as? String {
                    cell.LabelText.text = title
                }
            }
        }
        
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
        getNews()
    }
}
