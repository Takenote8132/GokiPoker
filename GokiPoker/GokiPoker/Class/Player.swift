//
//  Player.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

//MARK: - Main
class Player{
    let name: String
    let index: Int
    var hand: PlayerHandField
    var field: PlayerField
    
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
        hand.cardsInField.append(card)
    }
    
    func addCardToField(card: Card){
        field.cardsInField.append(card)
    }
    
    func showHand() -> String {
        return hand.showAll()
    }
    
    func showField() -> String {
        return field.showAll()
    }
}
