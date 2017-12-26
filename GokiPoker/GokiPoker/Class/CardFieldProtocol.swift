//
//  CardFieldProtocol.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

//MARK: - Main
protocol CardFieldProtcol{
    var cardsInField: [Card] { set get }
    var index: Int {get}//to recoggnize who is master of this field.
    func showAll() -> String
    mutating func addCard(card: Card) -> Void
    init(index: Int)
}

//MARK: - OptionalMethod
extension CardFieldProtcol{
    func showAll() -> String {
        var rtnString: String = ""
        for card in cardsInField{
            rtnString += card.name + ", "
        }
        return String(rtnString.prefix(rtnString.count - 2))
    }
    
    mutating func addCard(card: Card) -> Void {
        cardsInField.append(card)
    }
}
