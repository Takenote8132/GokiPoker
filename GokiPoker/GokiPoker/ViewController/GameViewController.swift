//
//  GameViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/31.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

/*
 メインとなるGame画面のViewController
 それぞれのユーザーはここでPlayerの持っているCardや自分の手札を確認しつつ、カードを出すことも受けることも行う。
 画面は大きく三分割されている。
    一番上：今自分が狙っているPlayerの場のCardが表示されている。横にSwipeすることで他のPlayerの場のCardを表示する事も可能
    真ん中：自分と狙っている相手以外の情報が表示されるViewと、相手に「何と宣言して」「どのCardを出すか」を決めるViewとをSwipeして切り替える。
           もし自分がカードを差し出されている時はその情報ともに、受けるか再度カードを回すかも選べる。
    一番下：自分の手札と場が表示される
 */

class GameViewController: UIViewController, UIPageViewControllerDataSource  {

    
    //一番上に表示される、今自分が睨んでいるPlayerの場を表示するためのView
    @IBOutlet weak var targetPlayerCustomView: PlayerFieldCustomView!
    
    //真ん中部分：「その他のPlayerの情報」<->「宣言の決定」を入れ替えるためのPager
    var pageViewController: UIPageViewController?
    
    //初期設定画面からPlayerの名前が[String]として渡されてくるのでそれをここで受け取る
    var playerNames: [String] = []
    //PagerViewControllerの位置を管理するための変数
    private var currentPage: Int = 0
    
    //gameFieldは唯一ここに生成される。以後Gameが終わるまでこのViewControllerからは動かない。
    static var gameField: GameField?
    
    //pageViewControllerの中には以下の二つのViewControllerが入る
    //その他のPlayer情報を表示するためのView
    var playersPagerViewController: PlayersPagerViewController?
    //Cardの宣言内容を決めるためのView
    var targetSelectViewController: TargetSelectViewController?
    
    //一番下に表示されるTurnPlayerのView
    var turnPlayerViewController: TurnPlayerViewController?
    
    override func viewDidLoad() {
        print("debug_viewDidLoad()_GameViewController")
        super.viewDidLoad()
        GameViewController.gameField = GameField(namesOfPlayers: playerNames)   //GameFieldを初期化した
        targetPlayerCustomView.playerNameLabel.text = playerNames[0]            //targetPlayerの名前を一番上のViewのところにセット
    }
    
    //人数に応じて大きさが変わる動的なレイアウト作成のために、このfuncが必要だった。
    //ViewDidLoadの時にViewControllernoのインスタンスを作成すると更新されたContraintの情報が反映されない？
    //問題が発生しそうな箇所なので改善検討の必要あり
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("debug_viewWillLayoutSubviews()_GameViewController")
        
        //真ん中のPagerの設定
        pageViewController = childViewControllers[0] as? UIPageViewController// ContainerView に Embed した UIPageViewController を取得する
        pageViewController!.dataSource = self// dataSource を設定する
        
        //Pager部分に入れるView。その他のPlayer情報を初期表示する画面として設定する
        playersPagerViewController = storyboard?.instantiateViewController(withIdentifier: "PlayersPagerViewController") as? PlayersPagerViewController
        pageViewController!.setViewControllers([playersPagerViewController!], direction: .forward, animated: false, completion: nil)// 最初に表示する配列の先頭の ViewController を設定

        //Pager部分に入れるView。なんと宣言して出すかを決める。まだ中身を実装していない。
        targetSelectViewController = storyboard?.instantiateViewController(withIdentifier: "TargetSelectViewController") as? TargetSelectViewController
        targetSelectViewController?.tempStr = "This is second View"

        //一番下の自分の状態を表示するView。
        turnPlayerViewController = childViewControllers[1] as? TurnPlayerViewController//
        turnPlayerViewController?.setLabelText()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Func For TargetPlayer
    /*
     targetPlayerを入れ替えるためのswipe gesture recognizer用のfunction
     Playerの配列そのものをくるくる回して、それぞれのViewControllerにテキストを更新するように指示する。
     */
    @IBAction func rightSwipeForTopAction(_ sender: UISwipeGestureRecognizer) {
        print("debug_rightSwipeForTopAction")
        GameViewController.gameField?.lotatePlayer(swipeRight: true)
        targetPlayerCustomView.playerNameLabel.text = GameViewController.gameField?.getNameArray()[0]
        playersPagerViewController?.reloadViewTexts()
    }
    @IBAction func leftSwipeForTopAction(_ sender: UISwipeGestureRecognizer) {
        print("debug_leftSwipeForTopAction")
        GameViewController.gameField?.lotatePlayer(swipeRight: false)
        targetPlayerCustomView.playerNameLabel.text = GameViewController.gameField?.getNameArray()[0]
        playersPagerViewController?.reloadViewTexts()
    }
}

//MARK: - Function
extension GameViewController{
    
    //MARK: - Func For Pager
    /*
     Pager部分をControllするfunction
     今は機能していない。functionが呼ばれていることは確認できているがそれが反映されていない状況。20170113
     */
    // 逆方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("debug_GameViewController_SwipeLeft")
        if(currentPage == 1){
            print("debug_GameViewController_SwipeLeft_True_" + (playersPagerViewController?.description)!)
            currentPage = 0
            return playersPagerViewController
        }else{
            print("debug_GameViewController_SwipeLeft_False")
            return nil
        }
    }
    // 順方向にページ送りした時に呼ばれるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("debug_GameViewController_SwipeRight")
        if(currentPage == 0){
            print("debug_GameViewController_SwipeRight_True_" + (targetSelectViewController?.description)!)
            currentPage = 1
            return targetSelectViewController
        }else{
            print("debug_GameViewController_SwipeRight_False")
            return nil
        }
    }
}
