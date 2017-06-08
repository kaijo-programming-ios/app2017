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
    let eventArray: NSArray = ["海城説明会","校内案内","ハーイ！ナビターイム！","ご注文はこの企画ですか？","The 鉄研","中高生が全力で〇〇やって見た！"]
    let organArray: NSArray = ["海原会","文実ツアー部","高１有志","2年4組","鉄道研究部","出版部"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //インスタンス生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let img = UIImage(named:"\(imgArray[indexPath.row])")
        
        //Tag1生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        //Tag2生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "\(eventArray[indexPath.row])"
        
        //Tag3の生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(organArray[indexPath.row])"
        
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

}
