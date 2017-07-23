//
//  SeResultViewController.swift
//  Kaijosai2017
//
//  Created by Yosuke Onuma on 2017/06/08.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class SeResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    // アウトレット接続
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableField: UITableView!
    
    // 変数宣言
    var originEvent = [""]             // 全データ（企画名）
    var originOrgan = [""]             // 全データ（団体名）
    var displayEvent = [""]            // 表示するデータ（企画名）
    var displayOrgan = [""]            // 表示するデータ（団体名）
    var dataList:[String] = []
    
    // 初期化処理
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // デリゲート先の設定
        searchBar.delegate = self
        tableField.delegate = self
        tableField.dataSource = self
        
        // 何も入力されていなくても検索キーを押せるようにする
        searchBar.enablesReturnKeyAutomatically = false
        
        // CSV ファイル読み込み
        do {
            // CSV ファイルのパス名を取得
            let csvPath = Bundle.main.path(forResource: "eventData", ofType: "csv")
            
            // CSV ファイルのデータを取得
            let csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            
            // 改行区切りでデータを分割し、配列に格納
            dataList = csvData.components(separatedBy: "\n")
        } catch {
            print(error)
        }
        
        // カンマ区切りでデータを分裂し、配列に格納
        var index = 0;
        while index < dataList.count
        {
            let dataDetail = dataList[index].components(separatedBy: ",")
            originEvent.insert(dataDetail[1], at: index);
            originOrgan.insert(dataDetail[2], at: index);
            index += 1
        }
        
        originEvent.removeLast()
        originOrgan.removeLast()
        
        // 表示用配列の初期化（最初は origin をコピーして全て表示する）
        displayEvent = originEvent
        displayOrgan = originOrgan
        
        // テーブル再表示
        tableField.reloadData()
    }
    
    // テーブルの行数を指定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // 表示用配列の要素数 + 1（件数表示行）を返す
        return displayEvent.count + 1
    }
    
    // Cell に値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルのスタイルを指定する
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "myCell")
        
        // 最終行かそうでないかで分岐
        if indexPath.row == displayEvent.count
        {
            // 最終行の場合は検索結果件数を表示
            cell.textLabel?.textColor = UIColor.lightGray
            cell.textLabel?.text = "\(displayEvent.count)件の検索結果"
            
            // 選択不可にする
            cell.selectionStyle = .none
        }
        else
        {
            // 企画名
            cell.textLabel?.text = displayEvent[indexPath.row]
            // 団体名
            cell.detailTextLabel?.text = displayOrgan[indexPath.row]
        }
        
        // セルのアクセサリを設定
        cell.accessoryType = .none
        
        return cell
    }
    
    // 最終行を選択不可にする
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        // 最終行の件数セルは選択不可
        if indexPath.row >= displayEvent.count { return nil }
        else { return indexPath }
    }
    
    // サーチバーで検索ボタンが押された時の処理
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        // キーボードをしまう
        searchBar.resignFirstResponder()
        
        if searchBar.text == ""
        {
            // 空文字列の場合は全表示
            displayEvent = originEvent
            displayOrgan = originOrgan
        }
        else
        {
            // 表示用配列を初期化
            displayEvent = []
            displayOrgan = []
            
            // 処理中のインデックス
            var index = 0
            
            // 検索モードにより分岐
            if searchBar.selectedScopeButtonIndex == 0
            {
                // 「企画名から」が選択されている場合
                for event in originEvent
                {
                    // 検索対象文字を含んでいれば表示用配列（企画名）に追加
                    if event.range(of: searchBar.text!) != nil
                    {
                        displayEvent.append(event)
                        displayOrgan.append(originOrgan[index])
                    }
                    index += 1
                }
                
            }
            else
            {
                // 「団体名から」が選択されている場合
                for organ in originOrgan
                {
                    // 検索対象文字を含んでいれば表示用配列（団体名）に追加
                    if organ.range(of: searchBar.text!) != nil
                    {
                        displayOrgan.append(organ)
                        displayEvent.append(originEvent[index])
                    }
                    index += 1
                }
            }
        }
        
        // テーブル再表示
        tableField.reloadData()
    }
    
    // サーチバーのキャンセルボタンが押された時の処理
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        // サーチバーの中身を空にする
        searchBar.text = ""
        
        // キーボードをしまう
        searchBar.resignFirstResponder()
        
        // 表示用配列を元の配列と同じにする
        displayEvent = originEvent
        displayOrgan = originOrgan
        
        // テーブル再表示
        tableField.reloadData()
    }
    
    // Cell が選択された時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 指定した ID の Segue を初期化
        self.performSegue(withIdentifier: "showDetail", sender: dataList[(indexPath as NSIndexPath).row].components(separatedBy: ","))
    }
    
    // セグエで詳細ページに移動する際のデータの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // セグエが showDetail の時の処理
        if segue.identifier == "showDetail"
        {
            // 移動先のビューコントローラの data プロパティに値を設定する
            (segue.destination as! eventDetailViewController).data = sender as! [String]
        }
    }
    
    override func didReceiveMemoryWarning()
    {
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
