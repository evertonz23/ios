//
//  Numero.swift
//  Calculadora
//
//  Created by Everton Zanatta on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Number: Expression {
    
    let value: Double
    
    init(value: Double) {
        self.value = value
    }
    
    func process() -> Double {
        return self.value
    }
}
