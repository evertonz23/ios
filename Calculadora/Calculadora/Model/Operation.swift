//
//  Operation.swift
//  Calculadora
//
//  Created by Everton Zanatta on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Operation {
    
    let left: Expression
    let right: Expression
    
    init(leftTerm left: Expression, rightTerm right: Expression) {
        self.left = left
        self.right = right
    }
    
    func process(by operation: (Double, Double) -> Double) -> Double {
        let leftValue: Double = left.process()
        let rightValue: Double = right.process()
        return operation(leftValue, rightValue)
    }
}
