//
//  FirstViewController.swift
//  What's Cooking?
//
//  Created by Noah Evans on 03/06/2020.
//  Copyright © 2020 Velocity Apps. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    // Link display text
    @IBOutlet weak var displayText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayText.text = ""
        // Do any additional setup after loading the view.
    }
    // when new meal button pressed
    @IBAction func getNewMeal(_ sender: Any) {
        let mealArray = defaults.object(forKey: "meals") as? [String] ?? [String]()
        let emptyArray = mealArray.isEmpty
        if emptyArray == true {
            print("No meal")
            displayText.text = "You haven't got any meals saved. Head over to the Add Meals tab to get started."
        }
        else {
            let randomMeal = mealArray.randomElement()
            displayText.text = randomMeal
        }
    

}

}
