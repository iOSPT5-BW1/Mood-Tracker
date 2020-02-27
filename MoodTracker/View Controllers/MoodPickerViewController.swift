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
    let date = Date()
    var moodTracker: MoodTracker?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func moodButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            moodTracker?.mood = .angry
        case 2:
            moodTracker?.mood = .annoyed
        case 3:
            moodTracker?.mood = .angry
        case 4:
            moodTracker?.mood = .angry
        case 5:
            moodTracker?.mood = .angry
        case 6:
            moodTracker?.mood = .angry
        default:
            print("No mood selected")
        }
        performSegue(withIdentifier: "MoodQuoteSegue", sender: sender)
    }
    

}
