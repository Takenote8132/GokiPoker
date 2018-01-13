//
//  Card.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

/*
 現実にあるCardを表現したクラスです。
 実際のデッキ枚数と同じ数だけインスタンス化され、実体としてやり取りされることを想定しています。
 Enumとしてカードタイプを７種（ハエ、ゴキブリ、カメムシ、コウモリ、クモ、ネズミ、サソリ）とそれらがkingであるかないかのbool値をフィールドとして所持します。
 */


import Foundation

// MARK: Main
class Card{
    let cardType: CardTypeEnum? //このカードが何のカードであるかを示します
    let isKing: Bool            //このカードがkingであるかないかを示します
    
    //enumを扱いやすくするための配列です。カードを初期化する際forループで回そうとすると必要になりました。もっと賢いやり方がある気がします。
    static let cardTypeArray: [Card.CardTypeEnum] = [.hae, .goki, .kamemushi, .komori, .kumo, .nezumi, .sasori]
    static let numOfCardType: Int = Card.cardTypeArray.count    // カードタイプがいくつあるかの数字です。毎度countを呼び出すのが面倒だったので変数にしています。
    
    /*
     Cardの初期化です。
     forループで回して初期化したかったので引数にIntが使われています。が、こうするとenumを使う意味が薄れてしまっている...?ような気がしないでもないです。
     もしCardTypeArrayよりも大きな数値がでた場合はErrorCardが出力されます。
     */
    init(cardTypeIndex: Int, isKing: Bool) {
        if(cardTypeIndex < Card.numOfCardType){
            self.cardType = Card.cardTypeArray[cardTypeIndex]
            self.isKing = isKing
        }else{
            print("Error, error card was created. : cardTypeIndex = \(cardTypeIndex)")
            self.cardType = Card.CardTypeEnum.errorCard
            self.isKing = true
        }
        
    }
}

// MARK: - CardTypeEnum
/*
 CardTypeを示すためのenumです。
 文字にするときの手間を考えて戻り値をStringにしています。enumの要素数を直接数えることができればいいなーと思ったりしました。
 配列には入れないパターンとしてエラーパターンを用意しています。
 */
extension Card{
    enum CardTypeEnum {
        case hae, goki, sasori, komori, kamemushi, nezumi, kumo, errorCard
        var typeName: String{
            switch self {
            case .hae: return "ハエ"
            case .goki: return "ゴキブリ"
            case .sasori: return "サソリ"
            case .komori: return "コウモリ"
            case .kamemushi: return "カメムシ"
            case .nezumi: return "ネズミ"
            case .kumo: return "クモ"
            case .errorCard: return "エラーカード"
                //default: return "Null"
            }
        }
    }
}


//MARK: - Function
extension Card{
    //Cardの名前をComputedで返しています。キングのときは後ろに「_King」とつきます。
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

