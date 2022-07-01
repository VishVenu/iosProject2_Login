//
//  CalculatorViewController.swift
//  termProject2
//
//  Created by Vishakha Venugopal on 01/07/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var expressions:String = ""
    var startCalc:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "0"
        lblExpresions.text = "0"
    }

    @IBAction func btnClear(_ sender: Any) {
        lblExpresions.text = "0"
        lblResult.text = "0"
        expressions = ""
        startCalc = true
    }
    
    @IBAction func btnDone(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        if (expressions.count) > 0 {
            expressions.removeLast()
            lblResult.text = expressions
            lblExpresions.text = expressions
        }
        if (expressions.count) == 0 {
            lblResult.text = "0"
            lblExpresions.text = "0"
        }
    }
    
    
    @IBAction func btnDivide(_ sender: Any) {
        appendExpressions("÷")
        startCalc = false
    }
    
    
    @IBAction func btnSeven(_ sender: Any) {
        appendExpressions("7")
        startCalc = false
    }
    
    
    @IBAction func btnEight(_ sender: Any) {
        appendExpressions("8")
        startCalc = false
    }
    
    @IBAction func btnNine(_ sender: Any) {
        appendExpressions("9")
        startCalc = false
    }
    
    @IBAction func btnMultiply(_ sender: Any) {
        appendExpressions("x")
        startCalc = false
    }
    
    @IBAction func btnFour(_ sender: Any) {
        appendExpressions("4")
        startCalc = false
    }
    
    @IBAction func btnFive(_ sender: Any) {
        appendExpressions("5")
        startCalc = false
    }
    
    @IBAction func btnSix(_ sender: Any) {
        appendExpressions("6")
        startCalc = false
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        appendExpressions("-")
        startCalc = false
    }
    
    @IBAction func btnOne(_ sender: Any) {
        appendExpressions("1")
        startCalc = false
    }
    
    @IBAction func btnTwo(_ sender: Any) {
        appendExpressions("2")
        startCalc = false
    }
    
    @IBAction func btnThree(_ sender: Any) {
        appendExpressions("3")
        startCalc = false
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        appendExpressions("+")
        startCalc = false
    }
    
    @IBAction func btnZero(_ sender: Any) {
        appendExpressions("0")
        startCalc = false
    }
    
    @IBAction func btnPeriod(_ sender: Any) {
        appendExpressions(".")
        startCalc = false
    }

    @IBAction func btnEquals(_ sender: Any) {
        // added this check to stop the user from firing an equals operation before completing the expression
        if expressions.last! == "." || expressions.last! == "x" || expressions.last! == "-" || expressions.last! == "÷" || expressions.last! == "+" {
            return
        }
        do {
            let result = try executeExpression(expressions)
            lblResult.text = result
        }
        catch {
            lblResult.text = "Invalid expression"
        }
        startCalc = true
    }
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    @IBOutlet weak var lblExpresions: UILabel!
    
    func appendExpressions (_ str:String) {
        if self.checkExpression(str) {
            if (expressions == "0" || startCalc) {
                expressions = ""
            }
            
            expressions += str
            lblExpresions.text = expressions
            lblResult.text = expressions
        }
    }
    
    func executeExpression(_ expressions:String) throws -> String {
        var replacedExpressions = expressions.replacingOccurrences(of: "x", with: "*")
        replacedExpressions = replacedExpressions.replacingOccurrences(of: "÷", with: "/")
        let stringWithMathematicalOperation: String = replacedExpressions // Example
        let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
        
        // converted this to double because the expression cannot return anything bigger than a double type
        let result: Double = exp.expressionValue(with:nil, context: nil) as! Double // 25.0
       return String(result)
    }
    
    // checks if the entered character is valid or not
    func checkExpression(_ char: String) -> Bool {
        if startCalc {
            expressions = ""
        }
        if expressions == "" || expressions.last! == "." {
            if char == "+" || char == "-" || char == "÷" || char == "x" {
                return false
            }
        }
        if char == "0" {
            if expressions.last! == "÷" {
                return false
            }
        }
        if char == "." {
            for i in expressions.reversed() {
                print(String(i))
                if String(i) == char {
                    return false
                }
                if String(i) == "+" || String(i) == "-" || String(i) == "÷" || String(i) == "x" {
                    break
                }
            }
        }
        if char == "+" {
            if expressions.last! == "." || expressions.last! == "x" || expressions.last! == "-" || expressions.last! == "÷" || expressions.last! == "+" {
                return false
            }
        }
        if char == "-" {
            if expressions.last! == "." || expressions.last! == "+" || expressions.last! == "x" || expressions.last! == "÷" || expressions.last! == "-" {
                return false
            }
        }
        if char == "÷" {
            if expressions.last! == "." || expressions.last! == "+" || expressions.last! == "-" || expressions.last! == "x" || expressions.last! == "÷" {
                return false
            }
        }
        if char == "x" {
            if expressions.last! == "." || expressions.last! == "+" || expressions.last! == "-" || expressions.last! == "÷" || expressions.last! == "x" {
                return false
            }
        }
        return true
    }
}


