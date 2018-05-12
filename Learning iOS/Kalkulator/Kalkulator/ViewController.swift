//
//  ViewController.swift
//  Kalkulator
//
//  Created by Tomasz Kot on 18.04.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let nr = sender.titleLabel?.text!
        
        numberLabel.text = "\(numberLabel.text!)\(nr!)"
     
    }
    
    var lastNumber = 0
    
    @IBAction func plusPressed(_ sender: UIButton) {
        lastNumber = Int(numberLabel.text!)!
         numberLabel.text = ""
    
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        var actualNumber = Int(numberLabel.text!)!
        numberLabel.text = ""
        let calculatorLogic: KalkulatorLogic = KalkulatorLogic()
        let returnedValue = calculatorLogic.add(fistNumber: lastNumber, secondNumber: actualNumber)
        numberLabel.text! = "\(returnedValue)"
        
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

