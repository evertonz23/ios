//
//  Soma.swift
//  Calculadora
//
//  Created by Everton Zanatta on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Addition: Operation, Expression {
    
    func process() -> Double {
        return process(by: { $0 + $1 })
    }
}
