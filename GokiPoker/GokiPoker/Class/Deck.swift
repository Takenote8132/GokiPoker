//
//  Deck.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

/*
 現実でDeckを表現するためのクラスです。
 Cardクラスをインスタンス化し、配列として所持します。
 また自分自身が今どこまでカードを引かれたかを保持するためのindexというフィールドを所持しています。
 */


// MARK: - Main
class Deck{
    private var cards: [Card] = []  //この配列のindex番目のCardが次に引かれるカードになる。引かれたカードのインスタンスもそのまま残しているため、何らかの理由でindexが戻るとエラーになる
    private var index: Int  //この数値が今Deckが何枚引かれた状態にあるかを決める。外からはいじれないようにしている。
    
    init(numOfDeck num: Int) {
        self.index = 0          //初期化されたばかりなのでまだカードは一枚も引かれていない
        createDeck(num: num)    //num毎のカードを作成し配列に加えていく
        shuffule()              //デッキのカードをシャッフルする
    }
}

//MARK: -Function
extension Deck{
    //Cardに適当なcardTypeとisKingを割り振って配列に加えていく
    func createDeck(num: Int){
        var isKingTemp: Bool = false
        for i in 0 ..< num{
            if(i < Card.numOfCardType){//それぞれ1枚目だけkingにする
                isKingTemp = true
            }
            cards.append(Card(cardTypeIndex: (i%Card.numOfCardType), isKing: isKingTemp))
            isKingTemp = false
        }
        print("debug_deck_nameArray: " + getCardNameArray().description)
    }
    
    //デッキからCardを引く
    func getCard() -> Card {
        let card = self.cards[index]
        //self.cards[index] = Card(cardTypeIndex: 1000, isKing: true)       //エラーを明示的にするなら引いたカードはもうないよ、という処理をすべき？
        index += 1      //カードが引かれたので指標を一つずらす
        return card
    }
    
    //デッキのカードをシャッフルする
    func shuffule(){
        var tempCard: Card
        var rndInt: Int
        for i in 0 ..< cards.count{
            rndInt = Deck.random(min: 0, max: (cards.count-1) )
            tempCard = cards[i]
            cards[i] = cards[rndInt]
            cards[rndInt] = tempCard
        }
    }
    
    //シャッフル用のランダム生成関数
    public static func random(min n: Int, max x: Int) -> Int{
        let min = n < 0 ? 0 : n
        let max = x + 1
        let v = UInt32(max < min ? 0 : max - min)
        let r = Int(arc4random_uniform(v))
        return min + r
    }
    
    //debug用にcards配列の中身全てのnameをreturnさせるfunc
    func getCardNameArray() -> [String] {
        var nameArray: [String] = []
        for card in cards{
            nameArray.append(card.name)
        }
        return nameArray
    }
}
