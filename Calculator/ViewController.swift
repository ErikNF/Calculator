//
//  ViewController.swift
//  Calculator
//
//  Created by Эрик Нагаев on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Double = 0;
    var firstNum:Double = 0;
    var mathSign:Bool = false;
    var Operation:Int = 0;
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true  {
            result.text = String(sender.tag)
            mathSign = false
        }
        else  {
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11 { // деление
                result.text = "/";
            }
            else if sender.tag == 12 { // умножение
                result.text = "x";
            }
            else if sender.tag == 13 { // вычитание
                result.text = "-";
            }
            else if sender.tag == 14 { // добавлени
                result.text = "+";
            }
            else if sender.tag == 16 {
                result.text = "%";
            }
            Operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 15 { // посчитать все
            if Operation == 11 {
                result.text = String(firstNum / numberFromScreen)
            }
            else if Operation == 12 {
                result.text = String(firstNum * numberFromScreen)
            }
            else if Operation == 13 {
                result.text = String(firstNum - numberFromScreen)
            }
            else if Operation == 14 {
                result.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10  {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            Operation = 0
        }
    }
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

