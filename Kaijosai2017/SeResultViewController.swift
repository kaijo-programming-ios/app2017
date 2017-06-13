//
//  SeResultViewController.swift
//  Kaijosai2017
//
//  Created by Yosuke Onuma on 2017/06/08.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class SeResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    let imgArray: NSArray = ["kaijopic","mappic","navipic","searchpic","trainpic","wordpic"]
    var dataList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            //CSVファイルのパス名を取得
            let csvPath = Bundle.main.path(forResource: "eventData", ofType: "csv")
            //CSVファイルのデータを取得
            let csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            //改行区切りでデータを分裂し、配列に格納
            dataList = csvData.components(separatedBy: "\n")
        } catch {
            print(error)
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //インスタンス生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let img = UIImage(named:"\(imgArray[indexPath.row])")
        //カンマ区切りでデータを分裂し、配列に格納
        let dataDetail = dataList[indexPath.row].components(separatedBy: ",")
        
        //Tag1生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        //Tag2生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = dataDetail[1]
        
        //Tag3の生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = dataDetail[2]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //セグエで詳細ページに移動する際のデータの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //セグエがshowDetailの時の処理
        if segue.identifier == "showDetail" {
            //セグエがshowDetailの時実行する
            if let indexPath = self.table.indexPathForSelectedRow {
                //行のデータを取り出す
                let rowData = dataList[(indexPath as NSIndexPath).row].components(separatedBy: ",")
                //移動先のビューコントローラのdataプロパティに値を設定する
                (segue.destination as! eventDetailViewController).data = rowData
            }
        }
    }

}
