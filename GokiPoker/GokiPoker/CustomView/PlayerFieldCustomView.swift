//
//  PlayerField.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/29.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit


/*
 それぞれのPlayerのステータスを表示するためのViewです。
 名前、手札枚数、それぞれのカードを今何枚場に持っているか、 を示すために作られています。
 PlayerFieldCustomView.xibとセットです。
 */

//MARK: - Main
class PlayerFieldCustomView: UIView {

    @IBOutlet weak var playerNameLabel: UILabel!    //プレイヤーの名前を表示します
    @IBOutlet weak var numOfHandLabel: UILabel!     //Playerの手札枚数を表示します
    //それぞれのラベルが場に持っているカードの種類に対応しています。画像が入手でき次第LabelからImageViewへと変更するつもりです
    @IBOutlet weak var field0: UILabel!
    @IBOutlet weak var field1: UILabel!
    @IBOutlet weak var field2: UILabel!
    @IBOutlet weak var field3: UILabel!
    @IBOutlet weak var field4: UILabel!
    @IBOutlet weak var field5: UILabel!
    @IBOutlet weak var field6: UILabel!
    //上記Labelたちを一括管理するための空の配列です
    var fieldCardLabels = [UILabel]()
    
    //CustomViewを選択する際に誤入力に夜エラーが多かったため、上の方に引っ張ってきた名残です
    private let nameOfThisClass: String = "PlayerFieldCustomView"
    
    //コードから生成したときに通る初期化処理
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    //InterfaceBulderで配置した場合に通る初期化処理
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        //MyCustomView.xibファイルからViewを生成する。
        //File's OwnerはMyCustomViewなのでselfとする。
        guard let view = UINib(nibName: nameOfThisClass, bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        //ここでちゃんとあわせておかないと、配置したUIButtonがタッチイベントを拾えなかったりする。
        view.frame = self.bounds
        //伸縮するように
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        //addする。viewオブジェクトの2枚重ねになる。
        self.addSubview(view)
        
        //Label配列の初期化
        fieldCardLabels = [field0, field1, field2, field3, field4, field5, field6]
        
        //画像が手に入るまでの暫定処理としてLabelの背景色を変えることでカードの種類を表現しています
        setFieldBackgroundColor()
        
        //画像が手に入るまでの暫定処理としてLabelのTextに数字を入力することで枚数を表現しています。
        for lbl in fieldCardLabels{
            lbl.text = String(0)
            lbl.textColor = UIColor.white
        }
    }
}

//MARK: - Functions
extension PlayerFieldCustomView{
    //画像が入手できるまでの暫定処理として各カードタイプのイメージカラーをLabelの背景色にセットしています
    func setFieldBackgroundColor(){
        //[.hae, .goki, .kamemushi, .komori, .kumo, .nezumi, .sasori]
        field0.backgroundColor = UIColor.blue
        field1.backgroundColor = UIColor.brown
        field2.backgroundColor = UIColor.green
        field3.backgroundColor = UIColor.purple
        field4.backgroundColor = UIColor.black
        field5.backgroundColor = UIColor.gray
        field6.backgroundColor = UIColor.orange
    }
    
    //配列で扱うのが面倒なので中身にテキストをセットするためのfuncを用意しました。
    func setFieldLabelText(at: Int, text: String){
        fieldCardLabels[at].text = text
    }
}
