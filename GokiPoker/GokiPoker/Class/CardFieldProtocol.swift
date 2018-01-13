//
//  CardFieldProtocol.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

/*
 Cardを複数持つようなFieldに共通して持って欲しい性質をまとめたProtocolです。(Deckは別処理にしています。が、本当ならそれも一緒くたにできるものなのかな？)
 カードの配列と、自分がどこに所属しているかを示すための指標と、自己表現関数とカードを加えるための関数を持っています。
 */


//MARK: - Main
protocol CardFieldProtcol{
    var cardsInField: [Card] { set get }        //Cardのインスタンスを入れるための配列です
    var index: Int {get}                        //自分を識別するための指標です
    func showAll() -> String                    //持っているCardの中身をStringで返す関数です。中身もここで実装しています。
    mutating func addCard(card: Card) -> Void   //自分のCard配列にCardを加えるための関数です。中身もここで実装しています。
    init(index: Int)
}

//MARK: - OptionalMethod
extension CardFieldProtcol{
    func showAll() -> String {
        var rtnString: String = ""
        for card in cardsInField{
            rtnString += card.name + ", "
        }
        return String(rtnString.prefix(rtnString.count - 2))//最後のコンマを消すための処理
    }
    
    mutating func addCard(card: Card) -> Void {
        cardsInField.append(card)
    }
}
