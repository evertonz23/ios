//
//  CardTextProvider.swift
//  JogoDaMemoria
//
//  Created by Everton Zanatta on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

protocol CardTextProvider: AnyObject {
    
    var emojis: [Int: String] { get set }
    var emojisOptions: [String]  { get set }
    
    func text(for identifier: Int) -> String
}

extension CardTextProvider {
    
    func text(for identifier: Int) -> String {
        
        if let emoji = emojis[identifier] {
            return emoji
        }
        
        let emoji = emojisOptions.removeRandom()
        
        emojis[identifier] = emoji
        
        return emoji
    }
}

class HandsEmojiProvider: CardTextProvider {
    var emojis = [Int : String]()
    var emojisOptions = ["👍", "👌", "✋"]
}

class CuteAnimalsEmojiProvider: CardTextProvider {
    var emojis = [Int : String]()
    var emojisOptions = ["🐱", "🐶", "🐸"]
}
