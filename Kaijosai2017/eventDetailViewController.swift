//
//  eventDetailViewController.swift
//  Kaijosai2017
//
//  Created by Yosuke Onuma on 2017/06/13.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class eventDetailViewController: UIViewController {
    
    //　以下、サイドバーの設定
    //  サイドメニューが表示中かの真偽
    var isDisplayedSideMenu: Bool = false
    
    //  スクリーンサイズを格納するための変数
    var screenWidth: CGFloat = 0
    
    //  storyboard上のサイドメニュー(UIViewController)を格納するためのもの
    var sideMenuVC: UIViewController!
    //　以上、サイドバーの設定
    
    @IBOutlet weak var circleCut: UIImageView!
    @IBOutlet weak var bookEnable: UIButton!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var organName: UILabel!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var categorySet: UILabel!
    @IBOutlet weak var placeCode: UILabel!
    @IBOutlet weak var bookedLabel: UILabel!
    var dataList:[String] = []
    var bookmarkList:[String] = []
    var bookmarkList2:[String] = []
    var bookmarkNums:[String] = []
    
    //CSVファイルの保存先
    var userPath:String!
    let fileManager = FileManager()
    
    
    //検索画面からのデータ受け取り
    var data:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //　以下、サイドバーの設定
        //  スクリーンの幅を取得して、変数に格納
        screenWidth = getScreenSize().0
        
        //  メインビューにサイドメニューを追加
        addSideMenu()
        
        //　サイドメニューを非表示
        sideMenuVC.view.isHidden = true
        //　以上、サイドバーの設定
        
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
//            print(userPath)
            
            // カンマ区切りでデータを分裂し、配列に格納
            var index = 0;
            while index < bookmarkList.count
            {
                let bookmarkDetail = bookmarkList[index].components(separatedBy: ",")
                bookmarkNums.insert(bookmarkDetail[0], at: index);
                index += 1
            }
            
        } catch {
            print(error)
        }
        
        for nums in bookmarkNums {
            if String(nums) == String(data[0]) {
                bookedLabel.text = "ブックマーク登録済み"
                bookEnable.isEnabled = false
                break
            } else {
                bookedLabel.text = "ブックマーク未登録"
                bookEnable.isEnabled = true
            }
        }
        
        let picName = "i" + String(data[5])
        circleCut.image = UIImage(named: picName)
        placeCode.text = "場所コード：" + String(data[5]) + "　場所：" + String(data[4])
        eventName.text = data[2]
        organName.text = data[1]
//        categorySet.text = data[3]
        detailText.text = data[3]
        
       
    }
    
    //　画面遷移時、サイドメニューが出ていれば閉じる
    override func viewWillDisappear(_ animated: Bool) {
        if isDisplayedSideMenu == true {
            closeSideMenu()
        }
    }
    
    
    @IBAction func booking(_ sender: Any) {
        let dataStr = data.joined(separator: ",")
        bookmarkList.append(dataStr)
        saveCSV()
        bookEnable.isEnabled = false
        bookedLabel.text = "ブックマーク登録済み"
        bookedAlert()
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
    
    //ブックマーク登録完了のアラート表示
    func bookedAlert() {
        let alert = UIAlertController(title: "ブックマーク登録しました", message: "ホーム画面からいつでもアクセス可能です。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "完了", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    //　以下、サイドバーの設定
    
    
    @IBAction func buttonDetail(_ sender: Any) {
        //  サイドメニューが表示されていない時
        if isDisplayedSideMenu == false {
            //  サイドメニューを出す
            displaySideMenu()
        }
            //  サイドメニューが表示されている時
        else {
            //  サイドメニューを閉じる
            closeSideMenu()
        }
    }
    
    /*
     *  メソッド
     */
    // スクリーンのサイズを取得するためのメソッド
    func getScreenSize() -> (CGFloat, CGFloat) {
        
        //  スクリーンサイズを取得
        let screenSize = UIScreen.main.bounds.size
        
        //  スクリーンの幅と高さを変数に格納
        let width: CGFloat = screenSize.width
        let height: CGFloat = screenSize.height
        
        return (width, height)
    }
    
    //  サイドメニューをメインビューに追加するためのメソッド
    func addSideMenu() {
        
        //  サイドメニューをメインビューに追加
        sideMenuVC = (storyboard?.instantiateViewController(withIdentifier: "sideBar"))! as UIViewController
        self.addChildViewController(sideMenuVC)
        self.view.addSubview(sideMenuVC.view)
        sideMenuVC.didMove(toParentViewController: self)
        
        //  画面外に追加したサイドメニューを移動
        sideMenuVC.view.transform = CGAffineTransform(translationX: (screenWidth * -1), y: 0)
    }
    
    //  サイドメニューをメインビューに出すためのメソッド
    func displaySideMenu() {
        
        //　サイドメニューを表示
        sideMenuVC.view.isHidden = false
        //  サイドメニューをアニメーション付きで移動させる
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.sideMenuVC.view.transform = CGAffineTransform(translationX: (self.screenWidth * -1/2), y: 0)
        })
        
        //  サイドメニューが表示されていることにする
        isDisplayedSideMenu = true
    }
    
    //  サイドメニューを格納するためのメソッド
    func closeSideMenu() {
        
        //  サイドメニューをアニメーション付きで移動させる
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.sideMenuVC.view.transform = CGAffineTransform(translationX: (self.screenWidth * -1), y: 0)
        })
        
        //  サイドメニューが表示されていることにする
        isDisplayedSideMenu = false
        
        //　サイドメニューを非表示
        sideMenuVC.view.isHidden = true
    }
    //以上、サイドバーの設定
    
    
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
