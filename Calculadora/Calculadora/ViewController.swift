//
//  ViewController.swift
//  Calculadora
//
//  Created by Everton Zanatta on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func run(_ sender: UIButton) {
        wip()
    }
    
    func wip() {
        
        let calculator = Calculator()
        
        // wip - bind view
        calculator.putNextValue(expression: Number(value: 5))
        calculator.putOperation(operation: .division)
        calculator.putNextValue(expression: Number(value: 10))
        
        let result = calculator.calculate()
        
        display.text = result.format()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

