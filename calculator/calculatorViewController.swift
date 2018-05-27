//
//  calculatorViewController.swift
//  calculator
//
//  Created by user on 2018/5/27.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

enum OperationType {
    case add
    case subtract
    case multiply
    case divde
    case none
}
class calculatorViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var startNew = true
    var operation:OperationType = .none
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if label.text != nil {
            if startNew == true {
                label.text = "\(inputNumber)"
                startNew = false
            }else{
                if label.text == "0" || label.text == "+" || label.text == "-" || label.text == "X" || label.text == "/"{
                    label.text = "\(inputNumber)"
                }else{
                    label.text = label.text! + "\(inputNumber)"
                }
            }
        }
        numberOnScreen = Double(label.text!) ?? 0
    }
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = .none
        startNew = true
    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath == true {
            switch operation{
                case .add:
                    numberOnScreen = previousNumber + numberOnScreen
                    makeOKNumberString(from: numberOnScreen)
                case .divde:
                    numberOnScreen = previousNumber / numberOnScreen
                    makeOKNumberString(from: numberOnScreen)
                case .multiply:
                    numberOnScreen = previousNumber * numberOnScreen
                    makeOKNumberString(from: numberOnScreen)
                case .none:
                    label.text = "0"
                case .subtract:
                    numberOnScreen = previousNumber - numberOnScreen
                    makeOKNumberString(from: numberOnScreen)
            }
            performingMath = false
            startNew = true
        }
    }
    func makeOKNumberString(from number:Double){
        var okText: String
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 10 {
            okText = String(okText.prefix(10))
        }
        label.text = okText
    }
    
    @IBAction func add(_ sender: UIButton) {
        label.text = "+"
        operation = .add
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        label.text = "-"
        operation = .subtract
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        label.text = "/"
        operation = .divde
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        label.text = "X"
        operation = .multiply
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
