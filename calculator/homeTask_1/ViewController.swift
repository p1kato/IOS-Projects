//
//  ViewController.swift
//  homeTask_1
//
//  Created by Dias Narysov on 12/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plus(_ sender: Any) {
        let a = textField1.text!
        let b = textField2.text!
        let sum = (Int(a) ?? 0) + (Int(b) ?? 0)
        
        label.text = String(sum)
    }
    
    @IBAction func minus(_ sender: Any) {
        let a = textField1.text!
        let b = textField2.text!
        
        let sum = (Int(a) ?? 0) - (Int(b) ?? 0)
        
        label.text = String(sum)
    }
    
    @IBAction func multiply(_ sender: Any) {
        let a = textField1.text!
        let b = textField2.text!
        
        let sum = (Int(a) ?? 0) * (Int(b) ?? 0)
        
        label.text = String(sum)
    }
    
    @IBAction func divide(_ sender: Any) {
        let a = textField1.text!
        let b = textField2.text!
        
        let sum = (Double(a) ?? 0) + (Double(b) ?? 0)
        
        label.text = String(format: "%g", sum)
    }
    
    
    
    
    

}

