//
//  GameField.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

//MARK: - Main
class GameField {
    var players: [Player]
    var turnPlayer: Player      //players[player.count-1]
    var targetPlayer: Player    //players[0]
    private let deck: Deck
    private let numOfInitHand = 7
    
    init(namesOfPlayers: [String]) {
        var playersHoge:[Player] = []
        for i in 0 ..< namesOfPlayers.count{
            playersHoge.append(Player(index: i, name: namesOfPlayers[i]))
        }
        players = playersHoge
        turnPlayer = players[0]
        targetPlayer = players[players.count-1]
        deck = Deck(numOfDeck: 49)
        destributeCardsToPlayersFromDeck()
//        for player in players{
//            print("debug_GameField_player.showHand() : " + player.showHand())
//            print("debug_GameField_player.showField() : " + player.showHand())
//        }
    }
}


//MARK: - Function
extension GameField{
    
    func destributeCardsToPlayersFromDeck() {
        for _ in 0 ..< numOfInitHand{
            for player in players{
                player.addCardToHand(card: deck.getCard())
            }
        }
    }
    
    func getNameArray() -> [String] {
        var nameArray: [String] = []
        for i in 0 ..< players.count{
            nameArray.append(players[i].name)
        }
        return nameArray
    }
    
    func getName(at: Int) -> String{
        return players[at].name
    }
    func getNameLast() -> String{
        return players[players.count-1].name
    }
    
    func lotatePlayer(swipeRight: Bool){
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
        print("debug_playersName: " + getNameArray().description)
    }
}
