//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by avi on 09/02/15.
//  Copyright (c) 2015 avi. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    // Alternatives:
    // var opStack: Array<Op> = Array<Op>()
    // var opStack = Array<Op>()
    var opStack = [Op]()
    // Alternatives:
    // var knownOps = Dictionary<String, Op>()
    var knownOps = [String: Op]()
    
    // init does not require func keyword
    init() {
        knownOps["+"] = Op.BinaryOperation("+") { $1 + $0 }
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
        knownOps["×"] = Op.BinaryOperation("×") { $1 * $0 }
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["√"] = Op.UnaryOperation("√") { sqrt($0)}
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String) {
        
    }
}