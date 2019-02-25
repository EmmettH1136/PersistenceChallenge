//
//  RetrieveViewController.swift
//  PersistenceChallenge
//
//  Created by Bobb Darnell on 5/2/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit
import SafariServices

class RetrieveViewController: UIViewController {

    @IBOutlet weak var integerLabel: UILabel!
    @IBOutlet weak var arrayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    var retrievedURL: URL!
    var retrievedContact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func retrieveInteger(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For MVP
         ***************************************************/
        let integer = userDefaults.integer(forKey: "IntMVP")
        integerLabel.text = String(integer)
        
        /***************************************************
         * End Your Code Here For MVP
         ***************************************************/
    }
    
    @IBAction func retrieveURL(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #1
         ***************************************************/
        if let url = userDefaults.url(forKey: "URL1"){
            retrievedURL = url
        }
        /***************************************************
         * End Your Code Here For Stretch #1
         ***************************************************/
        let svc = SFSafariViewController(url: retrievedURL)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func retrieveArray(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #2
         ***************************************************/
        let array = userDefaults.array(forKey: "IntArray")
        arrayLabel.text = "\(array![0]), \(array![1]), \(array![2])"
        
        /***************************************************
         * End Your Code Here For Stretch #2
         ***************************************************/
    }
    
    @IBAction func retrieveClass(_ sender: UIButton) {
        /***************************************************
         * Start Your Code Here For Stretch #3
         ***************************************************/
        var retrievedPerson = Contact("yes", 2, "yes")
        if let object = UserDefaults.standard.data(forKey: "Contact") {
            if let objectDecoded = try? JSONDecoder().decode(Contact.self, from: object) as Contact {
                retrievedPerson = objectDecoded
            }
        } else {
            print("Decoding Failed")
        }
        nameLabel.text = retrievedPerson.name
        ageLabel.text = String(retrievedPerson.age)
        phoneLabel.text = retrievedPerson.phone
        /***************************************************
         * End Your Code Here For Stretch #3
         ***************************************************/
    }
}
