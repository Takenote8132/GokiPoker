//
//  TargetSelectViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/31.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit
/*
 カードを宣言するViewが来る予定、まだ中身は実装していない
 */


class TargetSelectViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    
    var tempStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempLabel.text = tempStr
        // Do any additional setup after loading the view.
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
