//
//  sideControllingViewController.swift
//  Kaijosai2017
//
//  Created by 大沼陽介 on 2017/09/07.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import UIKit

class sideControllingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func goHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func goSearch(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: nil)
        let history = self.navigationController?.viewControllers
        let newHistory = history?.last
        if let okHistory = newHistory {
            print(okHistory)
            self.navigationController?.setViewControllers([okHistory], animated: false)
        }
        self.performSegue(withIdentifier: "goSearch", sender: nil)
    }
    @IBAction func goMap(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: nil)
        let history = self.navigationController?.viewControllers
        let newHistory = history?.last
        if let okHistory = newHistory {
            print(okHistory)
            self.navigationController?.setViewControllers([okHistory], animated: false)
        }
        self.performSegue(withIdentifier: "goMap", sender: nil)
    }
    @IBAction func goBook(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: nil)
        let history = self.navigationController?.viewControllers
        let newHistory = history?.last
        if let okHistory = newHistory {
            print(okHistory)
            self.navigationController?.setViewControllers([okHistory], animated: false)
        }
        self.performSegue(withIdentifier: "goBook", sender: nil)
    }
    @IBAction func goTime(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: nil)
        let history = self.navigationController?.viewControllers
        let newHistory = history?.last
        if let okHistory = newHistory {
            print(okHistory)
            self.navigationController?.setViewControllers([okHistory], animated: false)
        }
        self.performSegue(withIdentifier: "goTime", sender: nil)
    }
    @IBAction func goCredit(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: nil)
        let history = self.navigationController?.viewControllers
        let newHistory = history?.last
        if let okHistory = newHistory {
            print(okHistory)
            self.navigationController?.setViewControllers([okHistory], animated: false)
        }
        self.performSegue(withIdentifier: "goCredit", sender: nil)
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
