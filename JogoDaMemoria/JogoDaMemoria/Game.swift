//
//  Game.swift
//  JogoDaMemoria
//
//  Created by Everton Zanatta on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Game {
    
    var cards = [Card]()
    var firstTurnedCard: Card?
    var secondTurnedCard: Card?
    
    init(numberOfPairOfCards: Int) {
        
        for index in 0..<numberOfPairOfCards {
            self.cards += [Card(identifier: index), Card(identifier: index)]
        }
        
        self.cards.shuffle()
    }
    
    func chooseCard(at index: Int) -> Bool {
        
        if self.cards.indices.contains(index) == false {
            return false
        }
        
        let currentCard = self.cards[index]
        
        if (currentCard.isMatched() || currentCard.isFaceUp()) {
            return false
        }
        
        currentCard.turn()
        
        if self.firstTurnedCard == nil {
            self.firstTurnedCard = currentCard
        
        } else if self.secondTurnedCard == nil {
            self.secondTurnedCard = currentCard
            if firstTurnedCard!.equals(to: self.secondTurnedCard!) {
                firstTurnedCard!.match()
                secondTurnedCard!.match()
            }

        } else {
            self.firstTurnedCard!.turn()
            self.secondTurnedCard!.turn()
            
            self.firstTurnedCard = currentCard
            self.secondTurnedCard = nil
        }
        
        return true
    }
}

