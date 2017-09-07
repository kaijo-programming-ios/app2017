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
    
    
    @IBAction func b1201(_ sender: Any) {
        self.performSegue(withIdentifier: "segue12", sender: dataList[0].components(separatedBy: ","))
    }
    @IBAction func b1202(_ sender: Any) {
        self.performSegue(withIdentifier: "segue12", sender: dataList[1].components(separatedBy: ","))
    }
    @IBAction func b1203(_ sender: Any) {
        self.performSegue(withIdentifier: "segue12", sender: dataList[2].components(separatedBy: ","))
    }
    @IBAction func b1204(_ sender: Any) {
        self.performSegue(withIdentifier: "segue12", sender: dataList[3].components(separatedBy: ","))
    }
    @IBAction func b1205(_ sender: Any) {
        self.performSegue(withIdentifier: "segue12", sender: dataList[4].components(separatedBy: ","))
    }
    @IBAction func b1206(_ sender: Any) {
        self.performSegue(withIdentifier: "segue12", sender: dataList[5].components(separatedBy: ","))
    }
    @IBAction func b1301(_ sender: Any) {
        self.performSegue(withIdentifier: "segue13", sender: dataList[6].components(separatedBy: ","))
    }
    @IBAction func b1302(_ sender: Any) {
        self.performSegue(withIdentifier: "segue13", sender: dataList[7].components(separatedBy: ","))
    }
    @IBAction func b1303(_ sender: Any) {
        self.performSegue(withIdentifier: "segue13", sender: dataList[8].components(separatedBy: ","))
    }
    @IBAction func b1304(_ sender: Any) {
        self.performSegue(withIdentifier: "segue13", sender: dataList[9].components(separatedBy: ","))
    }
    @IBAction func b1305(_ sender: Any) {
        self.performSegue(withIdentifier: "segue13", sender: dataList[10].components(separatedBy: ","))
    }
    @IBAction func b2301(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[11].components(separatedBy: ","))
    }
    @IBAction func b2302(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[12].components(separatedBy: ","))
    }
    @IBAction func b2303(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[13].components(separatedBy: ","))
    }
    @IBAction func b2304(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[14].components(separatedBy: ","))
    }
    @IBAction func b2305(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[15].components(separatedBy: ","))
    }
    @IBAction func b2306(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[16].components(separatedBy: ","))
    }
    @IBAction func b2307(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[17].components(separatedBy: ","))
    }
    @IBAction func b2308(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[18].components(separatedBy: ","))
    }
    @IBAction func b2309(_ sender: Any) {
        self.performSegue(withIdentifier: "segue23", sender: dataList[19].components(separatedBy: ","))
    }
    @IBAction func b2401(_ sender: Any) {
        self.performSegue(withIdentifier: "segue24", sender: dataList[20].components(separatedBy: ","))
    }
    @IBAction func b2402(_ sender: Any) {
        self.performSegue(withIdentifier: "segue24", sender: dataList[21].components(separatedBy: ","))
    }
    @IBAction func b2403(_ sender: Any) {
        self.performSegue(withIdentifier: "segue24", sender: dataList[22].components(separatedBy: ","))
    }
    @IBAction func b2404(_ sender: Any) {
        self.performSegue(withIdentifier: "segue24", sender: dataList[23].components(separatedBy: ","))
    }
    @IBAction func b2405(_ sender: Any) {
        self.performSegue(withIdentifier: "segue24", sender: dataList[24].components(separatedBy: ","))
    }
    @IBAction func b2406(_ sender: Any) {
        self.performSegue(withIdentifier: "segue24", sender: dataList[25].components(separatedBy: ","))
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
