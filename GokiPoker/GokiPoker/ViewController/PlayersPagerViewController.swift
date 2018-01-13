//
//  PlayersPagerViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/31.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

/*
 GameViewControllerの真ん中に表示する、その他のPlayerの情報を表示するためのViewです。
 有効となっているConstraintをPlayer人数に応じて切り替えています。
 */
class PlayersPagerViewController: UIViewController {

    //２〜６人を想定しているため、その他のPlayerは最大で4人になります。
    @IBOutlet weak var playerFieldView0: PlayerFieldCustomView!
    @IBOutlet weak var playerFieldView1: PlayerFieldCustomView!
    @IBOutlet weak var playerFieldView2: PlayerFieldCustomView!
    @IBOutlet weak var playerFieldView3: PlayerFieldCustomView!
    
    //それぞれのViewに対してn人用のConstraintを用意しています。
    @IBOutlet weak var const0for6: NSLayoutConstraint!
    @IBOutlet weak var const0for5: NSLayoutConstraint!
    @IBOutlet weak var const0for4: NSLayoutConstraint!
    @IBOutlet weak var const0for3: NSLayoutConstraint!
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
    
    //配列にnilを入れるのが面倒だったので適当なConstraintをnilの代わりとして用います。
    @IBOutlet weak var dammyConst: NSLayoutConstraint!
    
    var names: [String] = []
    var customViews: [PlayerFieldCustomView] = []
    var constrains = [[NSLayoutConstraint]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("debug_viewDidLoad_PlayerPagerViewController")
        
        //(i,j)のところにあるConstraintは　i番目のCustomViewに対して、(j+2)人用のもの　を意味しています。
        //(j+2)人の時にそのViewが必要ない場合はnilの代わりにdammyCnostが入っています。
        constrains = [[const0for2,const0for3, const0for4, const0for5, const0for6], [dammyConst, const1for3, const1for4, const1for5, const1for6], [dammyConst,dammyConst, const2for4, const2for5, const2for6], [dammyConst, dammyConst, dammyConst, const3for5, const3for6]]
        customViews = [playerFieldView0, playerFieldView1, playerFieldView2, playerFieldView3]
        
        //テキスト内容を更新するためのfunctionです。
        reloadViewTexts()
    }
    
    //Constraintを適用させるために、別のタイミングでConstraintに関するなにがしを呼んでいます。
    override func viewDidLayoutSubviews() {
        removeViewFrom(at: (GameViewController.gameField?.getNameArray().count)!)
        addaptSizeFor(num: (GameViewController.gameField?.getNameArray().count)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - Function
extension PlayersPagerViewController{
    //MARK: - reload view texts
    func reloadViewTexts(){
        var max: Int
        if let namesForHere = GameViewController.gameField?.getNameArray(){
            print("debug_namesForHere.count: " + namesForHere.count.description)
            if(namesForHere.count > customViews.count){
                max = customViews.count
            }else{
                max = namesForHere.count - 1
            }
            for i in 0 ..< max{
                print("debug_i: \(i)" )
                customViews[i].playerNameLabel.text = namesForHere[i+1]
            }
        }
    }
    
    //MARK: - setViews
    
    //いらないCustomViewを取り除いてしまうためのfunctionです。
    func removeViewFrom(at: Int){
        print("debug_removeViewFrom: " + String(at))
        print("debug_at = \(at), customViews.count = \(customViews.count)")
        if(at == 6){
            return
        }
        for i in (at-2) ..< customViews.count{
            print("debug_removeViewFrom_i = \(i)")
            customViews[i].removeFromSuperview()
        }
    }
    
    //Constraintを有効にするためのfunctionです
    func addaptSizeFor(num: Int){
        print("debug_addaptSizeFor: " + String(num))
        if(num == 6){
            return
        }else{
            for i in 0 ..< (num-2){
                if(constrains[i][num-2] === dammyConst){
                    print("debug_dammyConst_true: " + String(i))
                }else{
                    print("debug_dammyConst_false: " + String(i))
                    print("debug_(i, (num-2)) = (\(i), \(num-2))")
                    NSLayoutConstraint.activate([constrains[i][num-2]])
                    print("deactivate")
                    NSLayoutConstraint.deactivate([constrains[i][4]])
                }
            }
            
        }
    }
}
