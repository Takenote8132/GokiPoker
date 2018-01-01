//
//  GameViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/31.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIPageViewControllerDataSource  {

    
    @IBOutlet weak var customView0: PlayerFieldCustomView!
    
    var vcArray: [ViewController] = []
    var pageViewController: UIPageViewController?
    
    var playerNames: [String] = []
    var gameField: GameField?
    var now: Int = 0
    
    var vc: PlayersPagerViewController?
    var vc2: TargetSelectViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("debug_viewDidLoad()_GameViewController")
        gameField = GameField(namesOfPlayers: playerNames)
        customView0.playerNameLabel.text = playerNames[0]
    }

    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            print("debug_viewWillLayoutSubviews()_GameViewController")
            vc = storyboard?.instantiateViewController(withIdentifier: "PlayersPagerViewController") as? PlayersPagerViewController
            //vc?.names = playerNames
            vc?.gameField = gameField
            
            vc2 = storyboard?.instantiateViewController(withIdentifier: "TargetSelectViewController") as? TargetSelectViewController
            vc2?.tempStr = "This is second View"
            
            pageViewController = childViewControllers[0] as? UIPageViewController// ContainerView に Embed した UIPageViewController を取得する
            pageViewController!.dataSource = self// dataSource を設定する
            pageViewController!.setViewControllers([vc!], direction: .forward, animated: false, completion: nil)// 最初に表示する配列の先頭の ViewController を設定
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Func For TargetPlayer
    @IBAction func rightSwipeForTopAction(_ sender: UISwipeGestureRecognizer) {
        print("debug_rightSwipeForTopAction")
        gameField?.lotatePlayer(swipeRight: true)
        customView0.playerNameLabel.text = gameField?.getNameArray()[0]
        vc?.reloadViewTexts(gf: gameField!)
    }
    @IBAction func leftSwipeForTopAction(_ sender: UISwipeGestureRecognizer) {
        print("debug_leftSwipeForTopAction")
        gameField?.lotatePlayer(swipeRight: false)
        customView0.playerNameLabel.text = gameField?.getNameArray()[0]
        vc?.reloadViewTexts(gf: gameField!)
    }
}

//MARK: - Function
extension GameViewController{
    
    //MARK: - Func For Pager
    // 逆方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if(now == 1){
            now = 0
            return vc
        }else{
            return nil
        }
    }
    // 順方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if(now == 0){
            now = 1
            return vc2
        }else{
            return nil
        }
    }
}
