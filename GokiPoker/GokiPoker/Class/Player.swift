//
//  Player.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

/*
 現実世界にいるPlayerたちを表現するためのクラス。
 名前と指標番号、手札と場を持つ。
 */

//MARK: - Main
class Player{
    let name: String
    let index: Int
    var hand: PlayerHandField
    var field: PlayerField
    
    //初期化のタイミングでそれぞれのFieldに自分と同じindexを渡す
    init(index: Int, name: String) {
        self.name = name
        self.index = index
        hand = PlayerHandField(index: index)
        field = PlayerField(index: index)
    }
}

//MARK: - Function
extension Player{
    func addCardToHand(card: Card){
        hand.addCard(card: card)
    }
    
    func addCardToField(card: Card){
        field.addCard(card: card)
    }
    
    func showHand() -> String {
        print("debug_Player_showHand: " + hand.showAll().description)
        return hand.showAll()
    }
    
    func showField() -> String {
        print("debug_Player_showField: " + field.showAll().description)
        return field.showAll()
    }
}
