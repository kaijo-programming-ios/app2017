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
    
    //企画情報
    let imgArray = ["kaijopic","mappic","navipic","searchpic","trainpic","wordpic"]
    let eventArray = ["海城説明会","校内案内","ハーイ！ナビターイム！","ご注文はこの企画ですか？","The 鉄研","中高生が全力で〇〇やって見た！"]
    let organArray = ["海原会","文実ツアー部","高１有志","2年4組","鉄道研究部","出版部"]
    
    //検索結果の配列
    var searchResult1 = [String]()
    var searchResult2 = [String]()
    var searchResult3 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート先の設定
        self.table.delegate = self
        self.table.dataSource = self
        keywordSearchBar.delegate = self
        
        //何も入力されていなくても検索キーを押せるようにする
        keywordSearchBar.enablesReturnKeyAutomatically = false
        
        //検索結果配列にデータをコピー
        searchResult1 = imgArray
        searchResult2 = eventArray
        searchResult3 = organArray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.table.reloadData()
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //インスタンス生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let img = UIImage(named:"\(searchResult1[indexPath.row])")
        
        //Tag1生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        //Tag2生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "\(searchResult2[indexPath.row])"
        
        //Tag3の生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(searchResult3[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult2.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        keywordSearchBar.endEditing(true)
        
        //カウンター変数
        var counter = -1
        
        //一旦検索結果をリセット
        searchResult1.removeAll()
        searchResult2.removeAll()
        searchResult3.removeAll()
        
        if(keywordSearchBar.text == "") {
            //空の時は全表示
            searchResult1 = imgArray
            searchResult2 = eventArray
            searchResult3 = organArray
        } else {
            for data in eventArray {
                counter += 1
                if data.contains(keywordSearchBar.text!) {
                    //絞ったデータを代入
                    searchResult2.append(data)
                    searchResult1.append(imgArray[counter])
                    searchResult3.append(organArray[counter])
                }
            }
        }
        self.table.reloadData()
        
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
