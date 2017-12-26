//
//  Card.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

// MARK: Main
class Card{
    let cardType: CardTypeEnum?
    let isKing: Bool
    static let cardTypeArray: [Card.CardTypeEnum] = [.hae, .goki, .kamemushi, .komori, .kumo, .nezumi, .sasori]
    static let numOfCardType: Int = Card.cardTypeArray.count
    
    init(cardTypeIndex: Int, isKing: Bool) {
        self.cardType = Card.cardTypeArray[cardTypeIndex]
        self.isKing = isKing
        if(Card.numOfCardType != Card.cardTypeArray.count){
            print("Error, card type is not counted correctly")
        }
    }
}

// MARK: - CardTypeEnum
extension Card{
    
    enum CardTypeEnum {
        case hae, goki, sasori, komori, kamemushi, nezumi, kumo
        var typeName: String{
            switch self {
            case .hae: return "ハエ"
            case .goki: return "ゴキブリ"
            case .sasori: return "サソリ"
            case .komori: return "コウモリ"
            case .kamemushi: return "カメムシ"
            case .nezumi: return "ネズミ"
            case .kumo: return "クモ"
                //default: return "Null"
            }
        }
    }
}

//MARK: - Function
extension Card{
    var name: String{
        if let ct = self.cardType?.typeName{
            if(self.isKing){
                return ct + "_King"
            }else{
                return ct
            }
        }else{
            return "Error: Card type is null"
        }
    }
}

