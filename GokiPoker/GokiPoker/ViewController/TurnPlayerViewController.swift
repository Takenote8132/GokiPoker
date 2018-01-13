//
//  TurnPlayerViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2018/01/01.
//  Copyright © 2018年 竹野祐輔. All rights reserved.
//

import UIKit

/*
 GamgeViewControllerの一番下に表示される自分自身の場と手札を表示するためのViewです。
 場を表示するためのPlayerFieldCustomViewと手札を表示するためのCollectionViewからなっています。
 */

class TurnPlayerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var playerFieldCustomView: PlayerFieldCustomView!
    
    
    override func viewDidLoad() {
        print("debug_TurnPlayerViewController_viewDidLoad()")
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        //本当は手札の枚数を反映させるが今はまだしていない
        return 7
    }
    
    
    //データを返すメソッド。画像が入手出来次第手札にあった画像を表示する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        //コレクションビューから識別子「TTurnPlayerCardCell」のセルを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TurnPlayerCardCell", for: indexPath) as UICollectionViewCell
        //セルの背景色をランダムに設定する。
        cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()),blue: CGFloat(drand48()),alpha: 1.0)
        return cell
    }
}

//MARK: - Function
extension TurnPlayerViewController{
    //テキストなどを更新するためのfunction。今はまだ色々と足りていない
    func setLabelText(){
        playerFieldCustomView.playerNameLabel.text = GameViewController.gameField?.getNameLast()
    }
}

