//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Everton Zanatta on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)
        
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
        willSet {
            print("vai receber \(newValue)")
        }
    }
    
    var emojis = [Int: String]()
    var emojisOptions = ["🐱", "🐶", "🐸"]
//    , "🐭"]
    
    @IBOutlet var buttonsArray: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = buttonsArray.firstIndex(of: sender), self.game.chooseCard(at: cardNumber) {
            self.updateViewFromModel()
            self.flipCount += 1
        }
    }
    
    func updateViewFromModel() {
        
        for index in game.cards.indices {

            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            
//            if card.isMatched() {
//                button.backgroundColor = .clear
//                button.setTitle("", for: UIControl.State.normal)
//
//            } else
            if card.isFaceUp() {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(emoji(for: card), for: UIControl.State.normal)

            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        
        if let emoji = emojis[card.identifier] {
            return emoji
        }
        
        let emoji = emojisOptions.removeRandom()
        
        emojis[card.identifier] = emoji

        return emoji
    }
}
