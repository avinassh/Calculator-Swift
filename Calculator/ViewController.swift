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
    
    
    @IBAction func appendDigit(sender: UIButton) {
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + sender.currentTitle!
        }
        else {
            display.text = sender.currentTitle!
            userIsInTheMiddleOfTypingANumber = true
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

