//
//  ViewController.swift
//  calculator
//
//  Created by Shaelie Spallin on 2020-01-13.
//  Copyright © 2020 Shaelie Spallin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var numOnScreen:Double = 0;
    var prevNum:Double = 0;
    var perfMath:Bool = false;
    var operation = 0;
    
    @IBAction func numbers(_ sender: UIButton) {
        // Event handler shared by all of the number buttons: 0-9
        
        if perfMath == true {
            display.text = String(sender.tag-1);
            numOnScreen = Double(display.text!)!;
            perfMath = false;
        } else {
            /* ! here means we are forced unwrapping an optional
                   if it == nil, it will throw runtime error and crash
             * sender is the button that was pressed
             */
            display.text = display.text! + String(sender.tag-1);
            
            /* Cast the string as a double, inside ! ensures it is not nil and
               outside ! makes sure we can cast it as a Double
             */
            numOnScreen = Double(display.text!)!;
        }
    }

    @IBAction func buttons(_ sender: UIButton) {
        // Event handler for the utility buttons - C, /, x, -, +, =
        
        //check for a number:
        if display.text != "" && sender.tag != 11 && sender.tag != 16 {
            // not the C or = button
            prevNum = Double(display.text!)!;  // get the old number
            
            if sender.tag == 12 {  // divide
                display.text = "/";
            } else if sender.tag == 13 {  // multiply
                display.text = "x";
            } else if sender.tag == 14 {  // subtract
                display.text = "-";
            } else if sender.tag == 15 {  // add
                display.text = "+";
            }
            
            operation = sender.tag;
            perfMath = true;
            
        } else if display.text != "" && sender.tag == 16 {
            // = button
            if operation == 12 {  // divide
                display.text = String(prevNum / numOnScreen);
            } else if operation == 13 {  // multiply
                display.text = String(prevNum * numOnScreen);
            } else if operation == 14 {  // subtract
                display.text = String(prevNum - numOnScreen);
            } else if operation == 15 {  // add
                display.text = String(prevNum + numOnScreen);
            }

        } else if sender.tag == 11 {
            // reset button
            display.text = "";
            prevNum = 0;
            numOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

