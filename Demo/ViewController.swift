//
//  ViewController.swift
//  Demo
//
//  Created by Paul Griffin on 2017-06-02.
//  Copyright © 2017 Knowit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func submitTapped(_ sender: Any) {
        
    }
    
    func validateName(name: String) -> Bool {
        let components = name.components(separatedBy: " ")
        
        guard let components.count == 2 else { return false }
        
    }

}

