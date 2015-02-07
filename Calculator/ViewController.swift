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

    var userIsInTheMiddleOfTypingANumber = false
    //var operands = Array<Double>()
    var operandStack = [Double]()
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + sender.currentTitle!
        }
        else {
            display.text = sender.currentTitle!
            userIsInTheMiddleOfTypingANumber = true
        }
        

    }
    
    @IBAction func operrate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
            case "÷":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() / operandStack.removeLast()
                    enter()
            }
            
            case "×":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() * operandStack.removeLast()
                    enter()
            }
            
            case "−":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() - operandStack.removeLast()
                    enter()
            }
            
            case "+":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() + operandStack.removeLast()
                    enter()
                }
            default: break
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println(operandStack)
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

