//
//  ViewController.swift
//  Calculator
//
//  Created by avi on 07/02/15.
//  Copyright (c) 2015 avi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var history: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    var userHasEnteredADot = false
    //var operands = Array<Double>()
    var operandStack = [Double]()
    var displayValue: Double? {
        get {
            let text = display.text!
            if text == "π" {
                return M_PI
            }
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue!)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if digit == "π" {
            if userIsInTheMiddleOfTypingANumber {
                return
            }
            else {
                display.text = digit
                enter()
                return
            }
        }
        
        if digit == "." {
            if userHasEnteredADot {
                return
            }
            else {
                userHasEnteredADot = true
            }
        }
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
    }
    
    @IBAction func operrate(sender: UIButton) {
        let operation = sender.currentTitle!
        history.text! += operation + "|"
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "÷": performOperation() { $1 / $0 }
            case "×": performOperation() { $1 * $0 }
            case "−": performOperation() { $1 - $0 }
            case "+": performOperation() { $1 + $0 }
            case "√": performOperation() { sqrt($0) }
            case "x²": performOperation() { $0 * $0 }
            case "sin": performOperation() { sin($0) }
            case "cos": performOperation() { cos($0) }
            case "tan": performOperation() { tan($0) }
            default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        userHasEnteredADot = false
        operandStack.append(displayValue!)
        history.text! += display.text! + "|"
        println(operandStack)
    }
    
    @IBAction func clear() {
        history.text = "history: "
        display.text = "0"
        operandStack = [Double]()
        userIsInTheMiddleOfTypingANumber = false
        userHasEnteredADot = false
    }
    
    @IBAction func backspace() {
        if countElements(display.text!) > 0 {
            display.text = dropLast(display.text!)
            clearDisplay()
        }
    }
    
    func clearDisplay() {
        if display.text!.isEmpty {
            userIsInTheMiddleOfTypingANumber = false
            display.text = "0"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

