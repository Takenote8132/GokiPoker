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
    static var gameField: GameField?
    var now: Int = 0
    
    var playersPagerViewController: PlayersPagerViewController?
    var targetSelectViewController: TargetSelectViewController?
    var turnPlayerViewController: TurnPlayerViewController?
    
    override func viewDidLoad() {
        print("debug_viewDidLoad()_GameViewController")
        super.viewDidLoad()
        GameViewController.gameField = GameField(namesOfPlayers: playerNames)
        customView0.playerNameLabel.text = playerNames[0]
    }

    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            print("debug_viewWillLayoutSubviews()_GameViewController")
            playersPagerViewController = storyboard?.instantiateViewController(withIdentifier: "PlayersPagerViewController") as? PlayersPagerViewController
        
            targetSelectViewController = storyboard?.instantiateViewController(withIdentifier: "TargetSelectViewController") as? TargetSelectViewController
            targetSelectViewController?.tempStr = "This is second View"
            
            pageViewController = childViewControllers[0] as? UIPageViewController// ContainerView に Embed した UIPageViewController を取得する
            pageViewController!.dataSource = self// dataSource を設定する
            pageViewController!.setViewControllers([playersPagerViewController!], direction: .forward, animated: false, completion: nil)// 最初に表示する配列の先頭の ViewController を設定
        
        print("debug_GameViewController_viewDidLoad_childViewController[1]: " + childViewControllers[1].description)
        turnPlayerViewController = childViewControllers[1] as? TurnPlayerViewController//
        turnPlayerViewController?.setLabelText()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Func For TargetPlayer
    @IBAction func rightSwipeForTopAction(_ sender: UISwipeGestureRecognizer) {
        print("debug_rightSwipeForTopAction")
        GameViewController.gameField?.lotatePlayer(swipeRight: true)
        customView0.playerNameLabel.text = GameViewController.gameField?.getNameArray()[0]
        playersPagerViewController?.reloadViewTexts()
    }
    @IBAction func leftSwipeForTopAction(_ sender: UISwipeGestureRecognizer) {
        print("debug_leftSwipeForTopAction")
        GameViewController.gameField?.lotatePlayer(swipeRight: false)
        customView0.playerNameLabel.text = GameViewController.gameField?.getNameArray()[0]
        playersPagerViewController?.reloadViewTexts()
    }
}

//MARK: - Function
extension GameViewController{
    
    //MARK: - Func For Pager
    // 逆方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if(now == 1){
            now = 0
            return playersPagerViewController
        }else{
            return nil
        }
    }
    // 順方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if(now == 0){
            now = 1
            return targetSelectViewController
        }else{
            return nil
        }
    }
}
