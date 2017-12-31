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
    
    var vcArray: [PlayersPagerViewController] = []
    var pageViewController: UIPageViewController?
    
    var playerNames: [String] = []
    var gameField: GameField?
    var thisIsTwice = false

    override func viewDidLoad() {
        super.viewDidLoad()
        print("debug_viewDidLoad()_GameViewController")
        
        gameField = GameField(namesOfPlayers: playerNames)
        customView0.playerNameLabel.text = playerNames[0]
        playerNames.removeFirst()
    }

    override func viewWillLayoutSubviews() {
        if(thisIsTwice){
            print("debug_viewWillLayoutSubviews()_GameViewController_twice")
                vcArray[0].removeViewFrom(at: vcArray[0].names.count)
        }else{
            super.viewWillLayoutSubviews()
            print("debug_viewWillLayoutSubviews()_GameViewController")
                let vc = storyboard?.instantiateViewController(withIdentifier: "PlayersPagerViewController") as! PlayersPagerViewController
                vc.names = playerNames
                vcArray.append(vc)
            
                let vc = storyboard?.instantiateViewController(withIdentifier: "TargetSelectViewController") as! TargetSelectViewController
                vc.tempStr = "This is second View"
                vcArray.append(vc)
            pageViewController = childViewControllers[0] as? UIPageViewController// ContainerView に Embed した UIPageViewController を取得する
            pageViewController!.dataSource = self// dataSource を設定する
            pageViewController!.setViewControllers([vcArray[0]], direction: .forward, animated: false, completion: nil)// 最初に表示する配列の先頭の ViewController を設定
            thisIsTwice = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - Function
extension GameViewController{
    
    //MARK: - Func For Pager
    // 逆方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcArray.index(of: viewController as! PlayersPagerViewController), index > 0 else {
            return nil
        }
        return vcArray[index - 1]
    }
    // 順方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcArray.index(of: viewController as! PlayersPagerViewController), index < vcArray.count - 1 else {
            return nil
        }
        return vcArray[index + 1]
    }
}
