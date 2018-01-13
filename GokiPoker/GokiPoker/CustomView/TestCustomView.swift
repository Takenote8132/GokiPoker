//
//  TestCustomView.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/27.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

/*
 これは練習用に作成したファイルなので中身はアプリに関係ありません。
 TestCustomView.xibとセットです。
 */

class TestCustomView: UIView {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var textView: UITextField!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
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
        guard let view = UINib(nibName: "TestCustomView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        //ここでちゃんとあわせておかないと、配置したUIButtonがタッチイベントを拾えなかったりする。
        view.frame = self.bounds
        
        //伸縮するように
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        //addする。viewオブジェクトの2枚重ねになる。
        self.addSubview(view)
    }
    
}
