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
    
    // http 통신 방법 - urlSession
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary<String,Any>>?
    func getNews(){
        // Http 통신은 BackGround 작업
        let task = URLSession.shared.dataTask(with: URL(string: "http://newsapi.org/v2/top-headlines?country=kr&category=technology&apiKey=")!) { (data, response, error) in
            if let dataJson = data {
                // json parsing
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    
                    // 그리는 것은 Main 쓰레드에서 해줘야 하므로 비동기
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData() // Main
                    }
                }
                catch{}
            }
        }
        
        task.resume()
    }
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
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
        if let news = newsData {
            let row = news[indexPath.row]
            if let r = row as? Dictionary<String, Any> {
                if let imageUrl = r["urlToImage"] as? String {
                    controller.imageUrl = imageUrl;
                }
                if let desc = r["description"] as? String{
                    controller.desc = desc;
                }
            }
        }
        
        // 이동 - 수동
        showDetailViewController(controller, sender: nil)
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "NewsDetail"{
            if let controller = segue.destination as? NewsDetailController{
                
                if let news = newsData {
                    if let indexPath = TableViewMain.indexPathForSelectedRow{
                        let row = news[indexPath.row]
                        if let r = row as? Dictionary<String, Any> {
                            if let imageUrl = r["urlToImage"] as? String {
                                controller.imageUrl = imageUrl;
                            }
                            if let desc = r["description"] as? String{
                                controller.desc = desc;
                            }
                        }
                    }
                }
            }
        }
        
        // 이동 - 자동
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        getNews()
    }
}
