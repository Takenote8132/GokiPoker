//
//  Deck.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

// MARK: - Main
class Deck{
    var cards: [Card] = []
    var index: Int
    
    init(numOfDeck num: Int) {
        self.index = 0
        createDeck(num: num)
        shuffule()
    }
}

//MARK: -Function
extension Deck{
    func createDeck(num: Int){
        var isKingTemp: Bool = false
        for i in 0 ..< num{
            if(i%4 == 0){
                isKingTemp = true
            }
            cards.append(Card(cardTypeIndex: i%7, isKing: isKingTemp))
            isKingTemp = false
        }
    }
    
    func getCard() -> Card {
        let card = self.cards[index]
        index += 1
        return card
    }
    
    func shuffule(){
        var tempCard: Card
        var rndInt: Int
        for i in 0 ..< cards.count{
            rndInt = Deck.random(min: 0, max: cards.count)
            tempCard = cards[i]
            cards[i] = cards[rndInt]
            cards[rndInt] = tempCard
        }
    }
    
    public static func random(min n: Int, max x: Int) -> Int{
        let min = n < 0 ? 0 : n
        let max = x + 1
        let v = UInt32(max < min ? 0 : max - min)
        let r = Int(arc4random_uniform(v))
        return min + r
    }
}
