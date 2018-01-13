//
//  PlayerHandField.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

/*
 Playerの手札を表現しているFieldです。
 まだ色々と未実装です。
 */
class PlayerHandField: CardFieldProtcol {
    
    var cardsInField: [Card] = []
    var index: Int
    
    required init(index: Int){
        self.index = index
    }
}

extension PlayerHandField{
    //まだ処理が足りていない。他の部分の処理が見えてきたら戻ってくる
    func playCardAt(num: Int) -> Card {
        return cardsInField[num]
    }
}
