//
//  ViewController.swift
//  PersistenceChallenge
//
//  Created by Bobb Darnell on 5/2/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit
let userDefaults = UserDefaults.standard
class StoreViewController: UIViewController {

    @IBOutlet weak var integerTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var arrayTextField1: UITextField!
    @IBOutlet weak var arrayTextField2: UITextField!
    @IBOutlet weak var arrayTextField3: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveInteger(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For MVP
         ***************************************************/
        if let integer = Int(integerTextField.text!) {
            userDefaults.set(integer, forKey: "IntMVP")
        }

        
        /***************************************************
         * End Your Code Here For MVP
         ***************************************************/
        integerTextField.resignFirstResponder()
    }
    
    @IBAction func saveUrl(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #1
         ***************************************************/
        if let url = URL(string: urlTextField.text!) {
            userDefaults.set(url, forKey: "URL1")
        }
        /***************************************************
         * End Your Code Here For Stretch #1
         ***************************************************/
        urlTextField.resignFirstResponder()
    }
    
    @IBAction func saveArray(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #2
         ***************************************************/
        if let number1 = Int(arrayTextField1.text!), let number2 = Int(arrayTextField2.text!), let number3 = Int(arrayTextField3.text!) {
            let array = [number1, number2, number3]
            userDefaults.set(array, forKey: "IntArray")
        }
        
        /***************************************************
         * End Your Code Here For Stretch #2
         ***************************************************/
        arrayTextField1.resignFirstResponder()
        arrayTextField2.resignFirstResponder()
        arrayTextField3.resignFirstResponder()
    }
    
    @IBAction func saveClass(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #3
         ***************************************************/
        if let age = Int(ageTextField.text!) {
            let person = Contact(nameTextField.text!, age, phoneTextField.text!)
            if let encoded = try? JSONEncoder().encode(person){
                UserDefaults.standard.set(encoded, forKey: "Contact")
            } else {
                print("Encoding Failed")
            }
        }
        
        /***************************************************
         * End Your Code Here For Stretch #3
         ***************************************************/
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}

