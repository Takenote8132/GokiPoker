//
//  InitialSettingViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

//MARK: - Main
/*
 プレイ人数とPlayerNameを入力するためのViewControllerです。
 上部にPlay人数を決めるためのドラムと下部にPlayerの名前を入力するためのTextViewを持ちます。
 */

class InitialSettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    //上のドラムと、その上下に表示する文字Labelです
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var onPickerLabel: UILabel!
    @IBOutlet weak var belowPickerLabel: UILabel!
    
    //名前を入力するためのTextViewです。左にあるLabelとセットでTextCustomViewを用いています。
    @IBOutlet weak var nameInputView0: TestCustomView!
    @IBOutlet weak var nameInputView1: TestCustomView!
    @IBOutlet weak var nameInputView2: TestCustomView!
    @IBOutlet weak var nameInputView3: TestCustomView!
    @IBOutlet weak var nameInputView4: TestCustomView!
    @IBOutlet weak var nameInputView5: TestCustomView!
    
    //let numOfPlayer: [[Int]] = [[2,3,4,5,6]]
    let numOfPlayer: [[Int]] = [[3,4,5,6]]      //ドラムに表示する数字です。ドラムは列を増やせるため今後ちょっとしたルールを追加するのにも使えます。
    var inputNameViews: [TestCustomView] = []   //TextViewを一括操作するための配列です
    var names: [String] = []                    //次のViewControllerに名前を行き渡すための配列
    var now: Int = 3                            //表示するTextVIewの数の初期値
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onPickerLabel.text = "プレイ人数を選択してください"
        belowPickerLabel.text = "人でプレイ!!"
        inputNameViews = [nameInputView0, nameInputView1, nameInputView2, nameInputView3, nameInputView4, nameInputView5]
        
        var i = 1
        for view in inputNameViews{
            if(i > now){
                //ドラムで選択された数値以上のTextViewは表示されない
                view.alpha = 0
            }
            view.leftLabel.text = "Player" + i.description + ": "
            view.textView.placeholder = "Input your name"
            i += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Segue
    //GameViewControllerへPlayerNameの配列を人数分の長さだけ引きわたす。名前が入力されていないものは自動的に「Player"n"」になる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toNextSegue") {
            print("debug_InitialSettingViewController_prepare()_toNextSegue")
            for i in 0 ..< now{
                if(inputNameViews[i].textView.text != ""){
                    names.append(inputNameViews[i].textView.text!)
                }else{
                    names.append("player"+String(i+1))
                }
            }
            print(names.description)
            //let vc: ViewController = segue.destination as! ViewController
            let vc: GameViewController = segue.destination as! GameViewController
            vc.playerNames = self.names
        }
    }
    
//MARK: - UIPickerView
    //コンポーネントの個数を返すメソッド
    @IBOutlet weak var numOfPlayersPicker: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numOfPlayer.count
    }

    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numOfPlayer[component].count
    }

    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numOfPlayer[component][row].description
    }

    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        now = numOfPlayer[component][row]
        showOrHideNameInputView(component: component, row: row)
    }
    
    func showOrHideNameInputView(component: Int, row: Int){
        for i in 0 ..< numOfPlayer[component][row]{
            inputNameViews[i].alpha = 1
        }
        for i in numOfPlayer[component][row] ..< inputNameViews.count{
            inputNameViews[i].alpha = 0
        }
    }
}
