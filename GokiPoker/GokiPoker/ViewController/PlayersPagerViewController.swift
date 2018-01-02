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
    
    @IBOutlet weak var dammyConst: NSLayoutConstraint!
    
    var names: [String] = []
    var customViews: [PlayerFieldCustomView] = []
    var constrains = [[NSLayoutConstraint]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("debug_viewDidLoad_PlayerPagerViewController")
        constrains = [[const0for2,const0ror3, const0for4, const0for5, const0for6], [dammyConst, const1for3, const1for4, const1for5, const1for6], [dammyConst,dammyConst, const2for4, const2for5, const2for6], [dammyConst, dammyConst, dammyConst, const3for5, const3for6]]
        customViews = [playerFieldView0, playerFieldView1, playerFieldView2, playerFieldView3]
        reloadViewTexts()
    }
    
    override func viewDidLayoutSubviews() {
        removeViewFrom(at: ((GameViewController.gameField?.getNameArray().count)!-1))
        addaptSizeFor(num: ((GameViewController.gameField?.getNameArray().count)!-1))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - Function
extension PlayersPagerViewController{
    //MARK: - reload view texts
    func reloadViewTexts(){
        if let namesForHere = GameViewController.gameField?.getNameArray(){
            for i in 0 ..< customViews.count{
                customViews[i].playerNameLabel.text = namesForHere[i+1]
            }
        }
    }
    
    //MARK: - setViews
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
            for i in 0 ..< 4{
                if(constrains[i][num-1] === dammyConst){
                    print("debug_dammyConst_true: " + String(i))
                }else{
                    print("debug_dammyConst_false: " + String(i))
                    NSLayoutConstraint.activate([constrains[i][num-1]])
                    NSLayoutConstraint.deactivate([constrains[i][3]])
                }
            }
            
        }
    }
}
