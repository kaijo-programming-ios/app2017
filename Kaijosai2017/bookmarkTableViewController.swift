//
//  bookmarkTableViewController.swift
//  Kaijosai2017
//
//  Created by 大沼陽介 on 2017/07/31.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class bookmarkTableViewController: UITableViewController {

    @IBOutlet var testTableView: UITableView!
    
    //ブックマーク配列
    var bookmarkList:[String] = []
    var bookmarkList2:[String] = []
    
    //CSVファイルの保存先
    var userPath:String!
    
    let fileManager = FileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // CSV ファイル読み込み
        do {
            //ユーザーが保存したCSVファイルのパス
            userPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/bookmarks.csv"
            
            var path = userPath
            if(fileManager.fileExists(atPath: path!) == false){
                //ユーザーが保存したCSVファイルが無い場合は、初期CSVファイルから読み込む。
                path = Bundle.main.path(forResource: "bookmarks", ofType: "csv")
                let csvData2 = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                bookmarkList = csvData2.components(separatedBy: "\n")
                //原因不明のバグを直すための調整
                bookmarkList.removeLast()
            } else {
                //ユーザーが保存したCSVファイルのデータを取得する。
                let csvData = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                bookmarkList = csvData.components(separatedBy: "\n")
            }
            
            //CSVファイルの出力先を確認する。
            print(userPath)
            
            //編集ボタン作成
            navigationItem.rightBarButtonItem = editButtonItem
            
        } catch {
            print(error)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    //セル数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookmarkList.count
    }

    //セル情報
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)

        
        //カンマでデータを分割して配列に格納する。
        let bookmarkDetail = bookmarkList[indexPath.row].components(separatedBy: ",")
        
        //セルのラベルに企画名、団体名を設定する
        cell.textLabel?.text = bookmarkDetail[2]
        cell.detailTextLabel?.text = bookmarkDetail[1]
        
        return cell
        
    }
    
    //編集可能設定
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //編集モード設定
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
   
    /*
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    
    //テーブルビュー編集時に呼ばれるメソッド
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            bookmarkList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }
        //テーブルの再読み込み
        tableView.reloadData()
        
        //CSVファイルにデータを保存する。
        saveCSV()
    }
    
    //CSVファイル保存メソッド
    func saveCSV() {
        
        //改行区切りで部活配列を連結する。
        let outputStr = bookmarkList.joined(separator: "\n")
        
        do {
            if(outputStr == "") {
                //部活配列が空の場合はユーザーが保存したCSVファイルを削除する。
                try fileManager.removeItem(atPath: userPath)
            } else {
                //ファイルを出力する。
                try outputStr.write(toFile: userPath, atomically: false, encoding: String.Encoding.utf8 )
            }
        } catch {
            print(error)
        }
    }
    
    
    
}
