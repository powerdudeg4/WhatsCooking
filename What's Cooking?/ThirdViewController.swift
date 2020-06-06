//
//  ThirdViewController.swift
//  What's Cooking?
//
//  Created by Noah Evans on 05/06/2020.
//  Copyright © 2020 Velocity Apps. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           
       }

       

       // Code for when any cell in the table view is selected
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // Says "ok, if this is section 0 (aka section 1), then do this"
           if indexPath.section == 0 {
               // Says "ok, if this is row 0, then do this"
               if indexPath.row == 0 {
                // Define blur
                let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
                let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
                blurVisualEffectView.frame = view.bounds
                
                // Start delete here
                let alertController = UIAlertController(title: "Head's up:", message: "You're about to delete all meals you've ever saved, forever.", preferredStyle: .alert)
                
                // Defines the name and type. In this case, its cancel, therefore it will be blue.
                let action2 = UIAlertAction(title: "No, keep my meals!", style: .cancel) { (action:UIAlertAction) in
                     blurVisualEffectView.removeFromSuperview()
                     // Do nothing.
                 }
                // Defines the name and type. In this case, its destructive, therefore it will be red.
                let action1 = UIAlertAction(title: "Yes, delete them.", style: .destructive) { (action:UIAlertAction) in
                     blurVisualEffectView.removeFromSuperview()
                    
                    // Calls the text field, then ".text" tells the app that you're talking about the text in the field.
                    UserDefaults.standard.removeObject(forKey: "meals")
                    print("removed")
                    blurVisualEffectView.removeFromSuperview()
                 }
                
                self.view.addSubview(blurVisualEffectView)
                
                // Adds the specefied actions
                alertController.addAction(action1)
                alertController.addAction(action2)
                // Presents the alert
                self.present(alertController, animated: true, completion: nil)
}
            
            }
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                // Feedback
                guard let feedbackSite = URL(string: "https://testflight.apple.com/#giving-feedback") else { return }
                    UIApplication.shared.open(feedbackSite)
                }
            if indexPath.row == 1 {
                // Twitter
                guard let twitterLink = URL(string: "https://twitter.com/velocityappshq") else { return }
                    UIApplication.shared.open(twitterLink)
            }
            
                }
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                //Share
                let items = ["I'm using an app called What's Cooking to decide what to eat. It's very simple and quick to find a meal you like. It's currently in beta, so you can help to test it here: https://velocityapps.tech/whatscooking"]
                let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
                        if let popoverPresentationController = ac.popoverPresentationController {
                             popoverPresentationController.sourceView = self.view
                            popoverPresentationController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                             popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
                        }
                        present(ac, animated: true)
                        }
            }
        }
            }
        
    

