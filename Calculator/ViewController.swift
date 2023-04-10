//
//  ViewController.swift
//  Calculator
//
//  Created by Mac on 07/03/23.
//

import UIKit
enum Operation:String{
    case Add = "+"
    case Substract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "null"
}
class ViewController: UIViewController {
   var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation : Operation = .Null
    @IBOutlet weak var outputLabel: UILabel!
    override func viewDidLoad() {
        outputLabel.text = "0"
    }
  
    @IBAction func numberPressed(_ sender: RoundBtn) {
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        
    }
    
    @IBAction func allClearPressed(_ sender: RoundBtn) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .Null
        outputLabel.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundBtn) {
        if runningNumber.count <= 7{
        runningNumber += "."
        outputLabel.text = runningNumber
        }
    }
    @IBAction func equalPresses(_ sender: RoundBtn) {
        opration(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: RoundBtn) {
        opration(operation: .Add)
    }
    
    @IBAction func substractPressed(_ sender: RoundBtn) {
        opration(operation: .Substract)    }
    
    @IBAction func mulPressed(_ sender: RoundBtn) {
        opration(operation: .Multiply)    }
    
    @IBAction func divPressed(_ sender: RoundBtn) {
        opration(operation: .Divide)
        
    }
    func opration(operation:Operation){
        if currentOperation != .Null{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                if currentOperation == .Add{
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Substract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)?.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
            
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
            
        }
    }
}
