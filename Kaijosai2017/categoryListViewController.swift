//
//  categoryListViewController.swift
//  Kaijosai2017
//
//  Created by Bwambocos on 2017/09/07.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class categoryListViewController: UIViewController {

    
    @IBOutlet weak var categoryListTable: UITableView!
    
    // 変数宣言
    var originEvent = [""]              // 全データ（企画名）
    var originOrgan = [""]              // 全データ（団体名）
    var categoryList = [""]             // カテゴリー名一覧
    var categoryData = [[]]           // 企画一覧
    var dataList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CSV ファイル読み込み
        do
        {
            // CSV ファイルのパス名を取得
            let csvPath = Bundle.main.path(forResource: "eventData", ofType: "csv")
            
            // CSV ファイルのデータを取得
            let csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            
            // 改行区切りでデータを分割し、配列に格納
            dataList = csvData.components(separatedBy: "\n")
            dataList.removeLast()
        }
        catch  { print(error) }
        
        // カンマ区切りでデータを分裂し、配列に格納
        var index = 0;
        while index < dataList.count
        {
            let dataDetail = dataList[index].components(separatedBy: ",")
            originEvent.insert(dataDetail[2], at: index);
            originOrgan.insert(dataDetail[1], at: index);
            index += 1
        }
        
        originEvent.removeLast()
        originOrgan.removeLast()
        
        // カテゴリー一覧 初期化
        dataList.removeAll()
        do
        {
            // CSV ファイルのパス名を取得
            let csvPath = Bundle.main.path(forResource: "categoryData", ofType: "csv")
            
            // CSV ファイルのデータを取得
            let csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            
            // 改行区切りでデータを分割し、配列に格納
            dataList = csvData.components(separatedBy: "\n")
            dataList.removeLast()
        }
        catch { print(error) }
        let dataDetail = dataList[0].components(separatedBy: ",")
        for i in dataDetail  { categoryList.insert(i, at: categoryList.endIndex - 1) }
        for i in dataList { categoryData.insert([i], at: categoryData.endIndex - 1) }
        categoryData.removeLast()
    }
    
    // データを返す
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "categoryListCell")
        cell.textLabel?.text = originEvent[categoryData[indexPath.section][indexPath.row] as! Int]
        cell.detailTextLabel?.text = originOrgan[categoryData[indexPath.section][indexPath.row] as! Int]
        cell.accessoryType = .none
        return cell
    }
    
    // データの個数を返す
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return categoryData[section].count
    }
    
    // セクション名を返す
    func tableView(tableView:UITableView, titleForHeaderInSection section:Int) -> String?
    {
        return categoryList[section]
    }
    
    // セクションの個数を返す
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return categoryList.count
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
