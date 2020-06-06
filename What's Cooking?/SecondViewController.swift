//
//  SecondViewController.swift
//  What's Cooking?
//
//  Created by Noah Evans on 03/06/2020.
//  Copyright © 2020 Velocity Apps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.entryBox.delegate = self
        // Do any additional setup after loading the view.
    }
   
    var meals = [String]()
    @IBOutlet weak var entryBox: UITextField!
    
    
    //hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        entryBox.resignFirstResponder()
        let newMeal = String(entryBox.text!)
        if newMeal == "" {
            print("Input is empty")
        }
        else {
            meals.append(newMeal)
            defaults.set(meals, forKey: "meals")
            
            
        
    }
        self.entryBox.text = ""
        return(true)
    


}

}
