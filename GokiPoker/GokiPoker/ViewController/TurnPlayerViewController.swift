//
//  TurnPlayerViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2018/01/01.
//  Copyright © 2018年 竹野祐輔. All rights reserved.
//

import UIKit

class TurnPlayerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var turnPlayerNameLabel: UILabel!
    @IBOutlet weak var TurnPlayerNumOfHandLabel: UILabel!
    
    override func viewDidLoad() {
        print("debug_TurnPlayerViewController_viewDidLoad()")
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 7
    }
    
    
    //データを返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //コレクションビューから識別子「TestCell」のセルを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TurnPlayerCardCell", for: indexPath) as UICollectionViewCell
        //セルの背景色をランダムに設定する。
        cell.backgroundColor = UIColor(red: CGFloat(drand48()),
                                       green: CGFloat(drand48()),
                                       blue: CGFloat(drand48()),
                                       alpha: 1.0)
        return cell
    }
}

//MARK: - Function
extension TurnPlayerViewController{
    func setLabelText(){
        turnPlayerNameLabel.text = GameViewController.gameField?.getNameLast()
    }
}

