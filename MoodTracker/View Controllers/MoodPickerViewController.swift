//
//  MoodPickerViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class MoodPickerViewController: UIViewController {
    
    let moodController = MoodModelController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func moodButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Angry")
        case 2:
            print("Annoyed")
        case 3:
            print("Sad")
        case 4:
            print("Meh")
        case 5:
            print("Happy")
        case 6:
            print("Excited")
        default:
            print("No mood selected")
        }
        performSegue(withIdentifier: "MoodQuoteSegue", sender: sender)
    }
    

}
