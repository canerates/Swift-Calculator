//
//  CalculatorLogic.swift
//  Swift Calculator
//
//  Created by Django on 2019/9/8.
//  Copyright © 2019 Caner Ates. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
            default :
                fatalError("Operation passed in does not match any operation")
            }
        }
        return nil
    }
}
