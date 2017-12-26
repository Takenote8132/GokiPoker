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
    private var players: [Player] = []
    private let deck: Deck
    private let numOfInitHand = 7
    
    init(namesOfPlayers: [String]) {
        for i in 0 ..< namesOfPlayers.count{
            players.append(Player(index: i, name: namesOfPlayers[i]))
        }
        deck = Deck(numOfDeck: 49)
        destributeCardsToPlayersFromDeck()
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
    
    
}
