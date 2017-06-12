//
//  SeResultViewController.swift
//  Kaijosai2017
//
//  Created by Yosuke Onuma on 2017/06/08.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class SeResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var keywordSearchBar: UISearchBar!
    
    // 企画情報定義
    let imgArray = ["kaijopic","mappic","navipic","searchpic","trainpic","wordpic"]
    let eventArray = ["海城説明会","校内案内","ハーイ！ナビターイム！","ご注文はこの企画ですか？","The 鉄研","中高生が全力で〇〇やって見た！"]
    let organArray = ["海原会","文実ツアー部","高１有志","2年4組","鉄道研究部","出版部"]
    
<<<<<<< HEAD
    // 検索結果の配列
    var searchResult1 = [String]()
    var searchResult2 = [String]()
    var searchResult3 = [String]()
=======
    let imgArray: NSArray = ["kaijopic","mappic","navipic","searchpic","trainpic","wordpic"]
    var dataList:[String] = []
>>>>>>> master
    
    // 初期化処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
        // デリゲート先の設定
        self.table.delegate = self
        self.table.dataSource = self
        keywordSearchBar.delegate = self
        
        // 何も入力されていなくても検索キーを押せるようにする
        keywordSearchBar.enablesReturnKeyAutomatically = false
        
        // 検索結果配列にデータをコピー
        searchResult1 = imgArray
        searchResult2 = eventArray
        searchResult3 = organArray
=======
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
        
>>>>>>> master
    }
    
    // セクションの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchResult2.count
    }
    
    // テーブルに表示する配列の総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult2.count
    }
    
    // Cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // インスタンス生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
<<<<<<< HEAD
        let img = UIImage(named:"\(searchResult1[indexPath.row])")
=======
        let img = UIImage(named:"\(imgArray[indexPath.row])")
        //カンマ区切りでデータを分裂し、配列に格納
        let dataDetail = dataList[indexPath.row].components(separatedBy: ",")
>>>>>>> master
        
        // Tag1生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag2生成
        let label1 = table.viewWithTag(2) as! UILabel
<<<<<<< HEAD
        label1.text = "\(searchResult2[indexPath.row])"
=======
        label1.text = dataDetail[1]
>>>>>>> master
        
        // Tag3の生成
        let label2 = table.viewWithTag(3) as! UILabel
<<<<<<< HEAD
        label2.text = "\(searchResult3[indexPath.row])"
=======
        label2.text = dataDetail[2]
>>>>>>> master
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.table.reloadData()
        super.viewWillAppear(animated)
    }
    
    // 検索処理
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        keywordSearchBar.endEditing(true)
        
        // カウンター変数
        var counter = 0
        
        // 一旦検索結果をリセット
        searchResult1.removeAll()
        searchResult2.removeAll()
        searchResult3.removeAll()
        
        if(keywordSearchBar.text == "") {
            // 空の時は全表示
            searchResult1 = imgArray
            searchResult2 = eventArray
            searchResult3 = organArray
        } else {
            for data in eventArray {
                if data.contains(keywordSearchBar.text!) {
                    // 絞ったデータを代入
                    searchResult2.append(data)
                    searchResult1.append(imgArray[counter])
                    searchResult3.append(organArray[counter])
                }
                counter += 1
            }
        }
        self.table.reloadData()
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

}
