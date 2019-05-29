//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Everton Zanatta on 26/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Card {
    
    var identifier: Int
    
    var state: CardState
    
    init(identifier: Int) {
        self.identifier = identifier
        self.state = .back
    }
    
    func turn() {
        
        switch self.state {
            
        case .matched:
            break
            
        case .front:
            self.state = .back
            break
            
        case .back:
            self.state = .front
            break
        }
    }
    
    func match() {
        self.state = .matched;
    }
    
    func isMatched() -> Bool {
        return self.state == .matched;
    }
    
    func isFaceUp() -> Bool {
        return self.state == .front || self.state == .matched;
    }
    
    func equals(to other: Card) -> Bool {
        return self.identifier == other.identifier
    }
}

enum CardState {
    case back, front, matched
}
