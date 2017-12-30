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
    
    
    @IBOutlet weak var constTopForZero: NSLayoutConstraint!
    @IBOutlet weak var constTopForDefault: NSLayoutConstraint!
    
    
    @IBOutlet weak var constOneforTwo: NSLayoutConstraint!
    @IBOutlet weak var constOneforThree: NSLayoutConstraint!
    @IBOutlet weak var constOneforFour: NSLayoutConstraint!
    @IBOutlet weak var constOneforFive: NSLayoutConstraint!
    @IBOutlet weak var constOneforSix: NSLayoutConstraint!
    
    @IBOutlet weak var constTowforzero: NSLayoutConstraint!
    @IBOutlet weak var constTwoforThree: NSLayoutConstraint!
    @IBOutlet weak var constTwoforFour: NSLayoutConstraint!
    @IBOutlet weak var constTwoforFive: NSLayoutConstraint!
    @IBOutlet weak var constTwoforSix: NSLayoutConstraint!
    
    @IBOutlet weak var constThreeforZero: NSLayoutConstraint!
    @IBOutlet weak var constThreeforFour: NSLayoutConstraint!
    @IBOutlet weak var constThreeforFive: NSLayoutConstraint!
    @IBOutlet weak var constThreeforSix: NSLayoutConstraint!
    
    @IBOutlet weak var constForforZero: NSLayoutConstraint!
    @IBOutlet weak var constFourforFive: NSLayoutConstraint!
    @IBOutlet weak var constFourforSix: NSLayoutConstraint!
    
    @IBOutlet weak var constFiveforZero: NSLayoutConstraint!
    @IBOutlet weak var constFiveforSix: NSLayoutConstraint!
    
    @IBOutlet weak var btn: UIButton!
    
    
    var customViews: [PlayerFieldCustomView] = []
    var playerNames: [String] = []
    var gameField: GameField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("debug_ViewDidLoad()")
        // Do any additional setup after loading the view, typically from a nib.
        customViews = [customView0, customView1, customView2, customView3, customView4, customView5]
        gameField = GameField(namesOfPlayers: playerNames)
    }
    
    override func viewWillLayoutSubviews() {
        print("debug_viewWillLayoutSubviews()")
        if let gf = gameField{
            for i in 0 ..< gf.players.count{
                customViews[i].playerNameLabel.text = playerNames[i]
            }
            changeSizeFor(at: gf.players.count)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func testAction(_ sender: Any) {
        customView2.removeFromSuperview()
        customView3.removeFromSuperview()
        customView4.removeFromSuperview()
        customView5.removeFromSuperview()
        NSLayoutConstraint.activate([constOneforTwo])
        NSLayoutConstraint.deactivate([constOneforSix])
    }
    
    
}

//MARK: - Function
extension ViewController{
    func changeSizeFor(at: Int){
        print("debug_changeSizeFor" + String(at))
        switch at {
        case 2:
            print("debug_case2")
            NSLayoutConstraint.activate([constOneforTwo])
            NSLayoutConstraint.deactivate([constOneforSix])
            
        case 3:
            print("debug_case3")
            NSLayoutConstraint.activate([constOneforThree])
            NSLayoutConstraint.activate([constTwoforThree])
            NSLayoutConstraint.deactivate([constOneforSix])
            NSLayoutConstraint.deactivate([constTwoforSix])
        case 4:
            print("debug_case4")
            NSLayoutConstraint.activate([constOneforFour])
            NSLayoutConstraint.activate([constTwoforFour])
            NSLayoutConstraint.activate([constThreeforFour])
            NSLayoutConstraint.deactivate([constOneforSix])
            NSLayoutConstraint.deactivate([constTwoforSix])
            NSLayoutConstraint.deactivate([constThreeforSix])
        case 5:
            print("debug_case5")
            NSLayoutConstraint.activate([constOneforFive])
            NSLayoutConstraint.activate([constTwoforFive])
            NSLayoutConstraint.activate([constThreeforFive])
            NSLayoutConstraint.activate([constFourforFive])
            NSLayoutConstraint.deactivate([constOneforSix])
            NSLayoutConstraint.deactivate([constTwoforSix])
            NSLayoutConstraint.deactivate([constThreeforSix])
            NSLayoutConstraint.deactivate([constFourforSix])
        default:
            print("debug_case6")
            NSLayoutConstraint.activate([constOneforSix])
            NSLayoutConstraint.activate([constTwoforSix])
            NSLayoutConstraint.activate([constThreeforSix])
            NSLayoutConstraint.activate([constFourforSix])
            NSLayoutConstraint.activate([constFiveforSix])
        }
        removeViewFrom(at: at)
    }

    func removeViewFrom(at: Int){
        if(at == 6){
            return
        }
        for i in at ..< customViews.count{
            customViews[i].removeFromSuperview()
        }
    }
}

