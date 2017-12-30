//
//  ViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var customView0: PlayerFieldCustomView!
    @IBOutlet weak var customView1: PlayerFieldCustomView!
    @IBOutlet weak var customView2: PlayerFieldCustomView!
    @IBOutlet weak var customView3: PlayerFieldCustomView!
    
    @IBOutlet weak var customView4: PlayerFieldCustomView!
    @IBOutlet weak var customView5: PlayerFieldCustomView!
    
    @IBOutlet weak var btn: UIButton!
    
    
    var customViews: [PlayerFieldCustomView] = []
    var playerNames: [String] = []
    var gameField: GameField?
    
    override func viewDidLoad() {
        print("before viewDidLoad()")
        super.viewDidLoad()
        print("after viewDidLoad()")
        // Do any additional setup after loading the view, typically from a nib.
        customViews = [customView0, customView1, customView2, customView3, customView4, customView5]
        gameField = GameField(namesOfPlayers: playerNames)
        if let gf = gameField{
            for i in 0 ..< gf.players.count{
                customViews[i].playerNameLabel.text = playerNames[i]
            }
            for i in gf.players.count ..< customViews.count{
                customViews[i].alpha = 0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

