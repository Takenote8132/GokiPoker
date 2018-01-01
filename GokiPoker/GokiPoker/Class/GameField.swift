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
    private let deck: Deck
    private let numOfInitHand = 7
    
    init(namesOfPlayers: [String]) {
        var playersHoge:[Player] = []
        for i in 0 ..< namesOfPlayers.count{
            playersHoge.append(Player(index: i, name: namesOfPlayers[i]))
        }
        players = playersHoge
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
    
    func lotatePlayer(swipeRight: Bool){
        if(swipeRight){
            let tempPlayer = players[0]
            for i in 0 ..< (players.count-1){
                players[i] = players[i+1]
            }
            players[players.count-1] = tempPlayer
        }else{
            let tempPlayer = players[players.count-1]
            for i in (0 ..< (players.count-1)).reversed(){
                players[i+1] = players[i]
            }
            players[0] = tempPlayer
        }
        print("playersName: " + getNameArray().description)
    }
}
