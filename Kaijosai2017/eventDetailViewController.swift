//
//  eventDetailViewController.swift
//  Kaijosai2017
//
//  Created by Yosuke Onuma on 2017/06/13.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class eventDetailViewController: UIViewController {
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var organName: UILabel!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var categorySet: UILabel!
    @IBOutlet weak var placeCode: UILabel!
    var dataList:[String] = []
    
    //検索画面からのデータ受け取り
    var data:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        placeCode.text = "場所コード：" + String(data[0]) + "　場所：" + String(data[4])
        eventName.text = data[2]
        organName.text = data[1]
//        categorySet.text = data[3]
        detailText.text = data[4]
        
        
        print(data)
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
