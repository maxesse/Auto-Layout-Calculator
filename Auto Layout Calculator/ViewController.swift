//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Max Sanna on 13/02/2018.
//  Copyright © 2018 Max Sanna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    var runningTotal: Double = 0
    var lastOperation: String = ""
    var operand: Double = 0
    var displayLabelText: String = "0"
    var displayResetFlag = false
    var negativeFlag = false
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorDisplay.text = displayLabelText
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        if lastOperation != "" && displayResetFlag == false {
            displayLabelText = "0"
            displayResetFlag = true
        }
        switch sender.tag {
        case 0:                                                 // 0
            if displayLabelText != "0" {
                displayLabelText = "\(displayLabelText)0"
            }
        case 1,2,3,4,5,6,7,8,9,10:                              // 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
            if displayLabelText == "0" {
                displayLabelText = "\(sender.tag)"
            } else {
                displayLabelText = "\(displayLabelText)\(sender.tag)"
            }
        
        case 20:                                                // Addition
            if lastOperation == "" {
                if let displayLabelDouble = Double(displayLabelText) {
                    runningTotal = displayLabelDouble
                }
            } else {
                if let displayLabelDouble = Double(displayLabelText) {
                    operand = displayLabelDouble
                }
                recalculate()
            }
            displayResetFlag = false
            lastOperation = "+"
        case 21:                                                // Subtraction
            if lastOperation == "" {
                if let displayLabelDouble = Double(displayLabelText) {
                    runningTotal = displayLabelDouble
                }
            } else {
                if let displayLabelDouble = Double(displayLabelText) {
                    operand = displayLabelDouble
                }
                recalculate()
            }
            displayResetFlag = false
            lastOperation = "-"
        case 22:                                                // Multiplication
            if lastOperation == "" {
                if let displayLabelDouble = Double(displayLabelText) {
                    runningTotal = displayLabelDouble
                }
            } else {
                if let displayLabelDouble = Double(displayLabelText) {
                    operand = displayLabelDouble
                }
                recalculate()
            }
            displayResetFlag = false
            lastOperation = "*"
        case 23:                                                // Division
            if lastOperation == "" {
                if let displayLabelDouble = Double(displayLabelText) {
                    runningTotal = displayLabelDouble
                }
            } else {
                if let displayLabelDouble = Double(displayLabelText) {
                    operand = displayLabelDouble
                }
                recalculate()
            }
            displayResetFlag = false
            lastOperation = "/"
        case 24:                                                // Equal
            if let displayLabelDouble = Double(displayLabelText) {
                operand = displayLabelDouble
            }
            displayResetFlag = false
            recalculate()
            lastOperation = ""
            displayLabelText = String(runningTotal)
            displayResetFlag = false
        case 30:                                                // Reset Key C
            displayLabelText = "0"
            displayResetFlag = false
            lastOperation = ""
            runningTotal = 0
            operand = 0
        case 31:                                                // +/-
            if !negativeFlag {
                if displayLabelText != "0" {
                    displayLabelText = "-\(displayLabelText)"
                    negativeFlag = true
                }
            } else {
                if displayLabelText != "0" {
                    displayLabelText.remove(at: displayLabelText.startIndex)
                    negativeFlag = false
                }
            }

        case 32:                                                // Percentage
            if lastOperation == "" {
                if let displayLabelDouble = Double(displayLabelText) {
                    runningTotal = displayLabelDouble / 100
                }
            } else {
                if let displayLabelDouble = Double(displayLabelText) {
                    operand = displayLabelDouble / 100
                }
                recalculate()
            }
            displayResetFlag = false
            lastOperation = ""
        default:
            print("Sender value out of range")
        }
        calculatorDisplay.text = displayLabelText
    }
    
    func recalculate() {
        switch lastOperation {
        case "+":
            runningTotal = runningTotal + operand
        case "-":
            runningTotal = runningTotal - operand
        case "*":
            runningTotal = runningTotal * operand
        case "/":
            runningTotal = runningTotal / operand
        case "%":
            runningTotal = runningTotal * operand
        default:
            print("Last operand out of range")
        }
        displayLabelText = String(runningTotal)
    }
}

