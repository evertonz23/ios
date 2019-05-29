//
//  Calculator.swift
//  Calculadora
//
//  Created by Everton Zanatta on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Calculator {
    
    var left: Expression = Number(value: 0)
    var right: Expression = Number(value: 0)
    var operationSymbol: OperationSymbol = .result
    var state: State = .left
    
    func putNextValue(expression: Expression) -> Double {
        
        switch self.state {
        
        case .left:
            self.left = expression
            self.state = .operation
            return self.left.process()
        
        case .right:
            self.right = expression
            self.state = .left
            return self.right.process()
        
        case .operation:
            return self.left.process()
        }
    }
    
    func putOperation(operation: OperationSymbol) {
        
        if self.state == .operation {
            self.operationSymbol = operation
            self.state = .right
        }
    }
    
    func calculate() -> Double {
        
        switch self.operationSymbol {
        
        case .addition:
            return Addition(leftTerm: self.left, rightTerm: self.right).process()
        
        case .subtraction:
            return Subtraction(leftTerm: self.left, rightTerm: self.right).process()
        
        case .multiplication:
            return Multiplication(leftTerm: self.left, rightTerm: self.right).process()
        
        case .division:
            return Division(leftTerm: self.left, rightTerm: self.right).process()
        
        default:
            return 0
        }
    }
    
    func clear() {
        self.left = Number(value: 0)
        self.right = Number(value: 0)
        self.operationSymbol = .result
        self.state = State.left
    }
}
