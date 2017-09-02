//
//  floorViewController.swift
//  Kaijosai2017
//
//  Created by 大沼陽介 on 2017/09/02.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class floorViewController: UIViewController {

    var dataList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CSV ファイル読み込み
        do {
            // CSV ファイルのパス名を取得
            let csvPath = Bundle.main.path(forResource: "eventData", ofType: "csv")
            
            // CSV ファイルのデータを取得
            let csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            
            // 改行区切りでデータを分割し、配列に格納
            dataList = csvData.components(separatedBy: "\n")
            dataList.removeLast()
        } catch {
            print(error)
        }
        
     
        // アニメーションの設定
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func b3101(_ sender: Any) {
        self.performSegue(withIdentifier: "segue31", sender: dataList[52].components(separatedBy: ","))
    }
    @IBAction func b3201(_ sender: Any) {
        self.performSegue(withIdentifier: "segue32", sender: dataList[53].components(separatedBy: ","))
    }
    @IBAction func b3301(_ sender: Any) {
        
        self.performSegue(withIdentifier: "segue33", sender: dataList[54].components(separatedBy: ","))
    }
    @IBAction func b3302(_ sender: Any) {
        
        self.performSegue(withIdentifier: "segue33", sender: dataList[55].components(separatedBy: ","))
    }
    
    // セグエで詳細ページに移動する際のデータの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // 移動先のビューコントローラの data プロパティに値を設定する
        (segue.destination as! eventDetailViewController).data = sender as! [String]
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
