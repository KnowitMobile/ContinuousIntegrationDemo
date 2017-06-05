//
//  ViewController.swift
//  Demo
//
//  Created by Paul Griffin on 2017-06-02.
//  Copyright © 2017 Knowit. All rights reserved.
//

import UIKit

class NameInputViewController: UIViewController {

    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func submitTapped(_ sender: Any) {
        let isValid = NameInputViewController.validateName(name: nameTextField.text!)
        
        if isValid {
            nameError.isHidden = true
            performSegue(withIdentifier: "showWorksScreen", sender: sender)
        } else {
            UIView.animate(withDuration: 0.2){
                self.nameError.isHidden = false
            }
        }
    }
    
    static func validateName(name: String) -> Bool {
        let components = name.components(separatedBy: " ")
        
        guard components.count == 2 else { return false }
        
        return true
    }

}

