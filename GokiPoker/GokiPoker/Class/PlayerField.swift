//
//  PlayerField.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

//MARK: - Protcol
class PlayerField: CardFieldProtcol {
    var cardsInField: [Card] = []
    var index: Int = 0
}

//MARK: - Oroginal function
extension PlayerField{
    func getStatus() -> [Int]{
        var howManyEachCards = [Int](repeating: 0, count: Card.numOfCardType)
        for card in cardsInField{
            for i in 0 ..< howManyEachCards.count{
                if(card.cardType == Card.cardTypeArray[i]){
                    howManyEachCards[i] += 1
                    break
                }
            }
        }
        return howManyEachCards
    }
}
