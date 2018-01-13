//
//  GameField.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

/*
 現実世界の盤面を表現するためのクラス。
 PlayerとDeckが存在している。それぞれのCardはPlayerの所有物として考えているため盤面に直接はない.
 */

//MARK: - Main
class GameField {
    var players: [Player]       //初期設定の時に決めたプレイ人数に応じた数だけの長さの配列ができる
    var turnPlayer: Player      //players[player.count-1]のところにいるPlayerを今のTurnPlayerとする
    var targetPlayer: Player    //players[0]のところにいるPlayerを今のTargetPlayerとする
    private let deck: Deck      //singletonにすべき？
    private let numOfInitHand = 7   //初期の手札の枚数。設定で変更できるようになる予定
    
    init(namesOfPlayers: [String]) {
        //宣言のタイミングで空の配列を作りたくなかったので試行錯誤したところこうなった。何か理解が足りていない気がする。
        var playersHoge:[Player] = []
        for i in 0 ..< namesOfPlayers.count{
            playersHoge.append(Player(index: i, name: namesOfPlayers[i]))
        }
        players = playersHoge
        
        //この二つのフィールドがあるべきかないべきかはゲームの中身の部分を実装しながら考えることにする
        turnPlayer = players[0]
        targetPlayer = players[players.count-1]
        
        //それぞれのカードタイプごとに7枚でDeckを初期化
        deck = Deck(numOfDeck: (Card.numOfCardType*7))

        //PlayerたちにCardを配る＋そのdebug
        destributeCardsToPlayersFromDeck()
        for player in players{
            print("debug_GameField_player.showHand(), \(player.name) : " + player.showHand())
            print("debug_GameField_player.showField(), \(player.name) : " + player.showHand())
        }
    }
}


//MARK: - Function
extension GameField{
    //playerたちにデッキからCardを配る。numOfInitHand枚数分
    func destributeCardsToPlayersFromDeck() {
        for _ in 0 ..< numOfInitHand{
            for player in players{
                player.addCardToHand(card: deck.getCard())
            }
        }
    }
    
    //Playerたちの名前を一括して取得する。
    //戻り値：playersと同じ長さの[String]
    func getNameArray() -> [String] {
        var nameArray: [String] = []
        for i in 0 ..< players.count{
            nameArray.append(players[i].name)
        }
        return nameArray
    }
    
    //指定したPlayerの名前を取得
    func getName(at: Int) -> String{
        return players[at].name
    }
    
    //配列の一番最後にいるPlayerの名前を取得する。TurnPlayerは配列の最後に配置されているPlayerと定義しているため、あると便利
    func getNameLast() -> String{
        return players[players.count-1].name
    }
    
    //Playerの配列をぐるっと回す。TargetとなるPlayerを決める際のTargetSelectViewControllerとの兼ね合いで必要になるfunc
    //引数としてどちら向きにswipeしたかがViewControllerより渡される。
    func lotatePlayer(swipeRight: Bool){
        print("debug_playersName_before: " + getNameArray().description)
        if(GameViewController.gameField?.players.count == 2){//参加人数が二人の時は回すという処理は走らない
            return
        }
        if(swipeRight){
            print("debug_GameField_lotatePlayer_swipeRight")
            let tempPlayer = players[0]
            for i in 0 ..< (players.count-2){
                players[i] = players[i+1]
            }
            players[players.count-2] = tempPlayer
        }else{
            print("debug_GameField_lotatePlayer_swipeLeft")
            let tempPlayer = players[players.count-2]
            for i in (0 ..< (players.count-2)).reversed(){
                players[i+1] = players[i]
            }
            players[0] = tempPlayer
        }
        print("debug_playersName_after: " + getNameArray().description)
    }
}
