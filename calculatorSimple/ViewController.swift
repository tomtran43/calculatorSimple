//
//  ViewController.swift
//  calculatorSimple
//
//  Created by Loc Tran on 2/16/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var distanceBetweenInputTextFieldAndResultLabel: NSLayoutConstraint!
    
    @IBOutlet weak var distanceBetweenLabelResultAndMiddleView: NSLayoutConstraint!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var isTappingNumber: Bool = false
    var isEndOperation: Bool = false
    var firstNumber: Double = 0
    var sencondNumber: Double = 0
    var operation: String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTextField.isUserInteractionEnabled = false
        firstNumber = 0
        sencondNumber = 0
        inputTextField.text = ""
        resultLabel.text = "0"
        isEndOperation = true
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        updateConstrains()
    }
    
    func updateConstrains(){
        let scale = UIScreen.main.bounds.size.height / 667
        
        distanceBetweenLabelResultAndMiddleView.constant = UIScreen.main.bounds.size.height > 480 ? distanceBetweenLabelResultAndMiddleView.constant * scale : distanceBetweenLabelResultAndMiddleView.constant * 0.1
        
        distanceBetweenInputTextFieldAndResultLabel.constant = UIScreen.main.bounds.size.height > 480 ? distanceBetweenInputTextFieldAndResultLabel.constant * scale : distanceBetweenInputTextFieldAndResultLabel.constant * 0.1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func numberAction(_ sender: UIButton) {
        let number = sender.currentTitle
        
        if isTappingNumber == true{
            inputTextField.text = inputTextField.text! + number!
        }else{
            inputTextField.text = number
            isTappingNumber = true
        }
        
    }
    
    
    @IBAction func operatorAction(_ sender: UIButton) {
        operation = sender.currentTitle!
        
        if let inputOperation = Double(inputTextField.text!){
            if isEndOperation == true{
                firstNumber = inputOperation
                isEndOperation = false
            }else{
                firstNumber = Double(resultLabel.text!)!
                inputTextField.text = "\(firstNumber)"
            }
        }else{
            print("Ban can nhap so truoc khi thuc hien tinh toan")
        }
        
        isTappingNumber = false
        if operation == "%"{
            equalAction(sender)
        }else if operation == "+/-"{
            if Double(inputTextField.text!) == 0{
                resultLabel.text = "0"
            }else{
            equalAction(sender)
            }
        }
    }

    @IBAction func equalAction(_ sender: UIButton) {
        isTappingNumber = false
        
        var result: Double = 0
        
        if let realSecondNumber = Double(inputTextField.text!){
            sencondNumber = realSecondNumber
        }
        
        switch operation{
            case "+":
                result = firstNumber + sencondNumber
            case "-":
                result = firstNumber - sencondNumber
            case "*":
                result = firstNumber * sencondNumber
            case "/":
                result = firstNumber / sencondNumber
            case "+/-":
                if firstNumber < 0{
                    firstNumber = fabs(firstNumber)
                    result = firstNumber
                }else{
                    firstNumber = -1 * firstNumber
                    result = firstNumber
                }
                //inputTextField.text = "\(result)"
            case "%":
                result = firstNumber / 100
        default:
            print("Error Operation")
        }
        
        if result == 0{
            resultLabel.text = String(format :"%2.3f", 0)
        }else{
            resultLabel.text = String(format: "%2.3f", result)
        }
    }
    
    
    @IBAction func ACAction(_ sender: UIButton) {
        firstNumber = 0
        sencondNumber = 0
        inputTextField.text = ""
        resultLabel.text = "0"
        isEndOperation = true
        
    }
    
}

