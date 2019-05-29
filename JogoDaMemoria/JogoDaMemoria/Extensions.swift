//
//  Extensions.swift
//  JogoDaMemoria
//
//  Created by Everton Zanatta on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension Bool {
    
    mutating func toggle() {
        self = !self
    }
}

extension Array {
    
    mutating func removeRandom() -> Element {
        return self.remove(at: Int.random(in: self.indices))
    }
}
