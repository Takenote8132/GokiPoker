//
//  PlayersPagerViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/31.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

class PlayersPagerViewController: UIViewController {

    @IBOutlet weak var playerFieldView0: PlayerFieldCustomView!
    @IBOutlet weak var playerFieldView1: PlayerFieldCustomView!
    @IBOutlet weak var playerFieldView2: PlayerFieldCustomView!
    @IBOutlet weak var playerFieldView3: PlayerFieldCustomView!
    @IBOutlet weak var playerFieldView4: PlayerFieldCustomView!
    
    @IBOutlet weak var dammyConst: NSLayoutConstraint!
    
    @IBOutlet weak var const0for6: NSLayoutConstraint!
    @IBOutlet weak var const0for5: NSLayoutConstraint!
    @IBOutlet weak var const0for4: NSLayoutConstraint!
    @IBOutlet weak var const0ror3: NSLayoutConstraint!
    @IBOutlet weak var const0for2: NSLayoutConstraint!
    
    @IBOutlet weak var const1for6: NSLayoutConstraint!
    @IBOutlet weak var const1for5: NSLayoutConstraint!
    @IBOutlet weak var const1for4: NSLayoutConstraint!
    @IBOutlet weak var const1for3: NSLayoutConstraint!
    
    @IBOutlet weak var const2for6: NSLayoutConstraint!
    @IBOutlet weak var const2for5: NSLayoutConstraint!
    @IBOutlet weak var const2for4: NSLayoutConstraint!
    
    @IBOutlet weak var const3for6: NSLayoutConstraint!
    @IBOutlet weak var const3for5: NSLayoutConstraint!
    
    @IBOutlet weak var const4for6: NSLayoutConstraint!
    
    var names: [String] = []
    var customViews: [PlayerFieldCustomView] = []
    var constrains = [[NSLayoutConstraint]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("debug_viewDidLoad_PlayerPagerViewController")
        constrains = [[const0for2,const0ror3, const0for4, const0for5, const0for6], [dammyConst, const1for3, const1for4, const1for5, const1for6], [dammyConst,dammyConst, const2for4, const2for5, const2for6], [dammyConst, dammyConst, dammyConst, const3for5, const3for6], [dammyConst,dammyConst,dammyConst,dammyConst, const4for6]]
        customViews = [playerFieldView0, playerFieldView1, playerFieldView2, playerFieldView3, playerFieldView4]
        for i in 0 ..< names.count{
            customViews[i].playerNameLabel.text = names[i]
        }
    }
    
    override func viewDidLayoutSubviews() {
        addaptSizeFor(num: names.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - Function
extension PlayersPagerViewController{
    func removeViewFrom(at: Int){
        print("debug_removeViewFrom: " + String(at))
        print("debug_at = \(at), customViews.count = \(customViews.count)")
        if(at == 5){
            return
        }
        for i in at ..< customViews.count{
            customViews[i].removeFromSuperview()
        }
    }
    
    func addaptSizeFor(num: Int){
        print("debug_addaptSizeFor: " + String(num))
        if(num == 5){
            return
        }else{
            for i in 0 ..< 5{
                if(constrains[i][num-1] === dammyConst){
                    print("debug_dammyConst_true: " + String(i))
                }else{
                    print("debug_dammyConst_false: " + String(i))
                    NSLayoutConstraint.activate([constrains[i][num-1]])
                    NSLayoutConstraint.deactivate([constrains[i][4]])
                }
            }
            
        }
        
    }
}
