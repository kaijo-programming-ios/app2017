//
//  TimeTableViewController.swift
//  Kaijosai2017
//
//  Created by 大沼陽介 on 2017/08/17.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class TimeTableViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var svScroll: UIScrollView!
    @IBOutlet weak var ivImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 準備処理
        doReady()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 設定（ズーム対象）
    func viewForZoomingInScrollView(scrollView:UIScrollView)-> UIView? {
        
        return self.ivImage
    }
    
    // 準備処理
    func doReady(){
        
        /*
         *ImageViewへ制約の設定が必要
         [Pin]のSpacingの値を、四方とも"0"ポイントにする。オートレイアウト機能をON
         */
        
        // 設定（デリゲート）
        self.svScroll.delegate = self
        
        
        // 設定（コンテンツサイズ（スクロール範囲））
        self.svScroll.contentSize = CGSize(
            width: self.ivImage.frame.size.width * 2.0,
            height: self.ivImage.frame.size.height * 2.0)
        
        // 設定（ズーム倍率の閾値）
        self.svScroll.minimumZoomScale = 1.0
        self.svScroll.maximumZoomScale = 5.0
        
    }
    
    

}
