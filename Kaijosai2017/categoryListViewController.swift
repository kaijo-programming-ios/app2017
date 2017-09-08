//
//  categoryListViewController.swift
//  Kaijosai2017
//
//  Created by Bwambocos on 2017/09/07.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class categoryListViewController: UIViewController {

    // 変数宣言
    var originEvent = [""]              // 全データ（企画名）
    var originOrgan = [""]              // 全データ（団体名）
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
