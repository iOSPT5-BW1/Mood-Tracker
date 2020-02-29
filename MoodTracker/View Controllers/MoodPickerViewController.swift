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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func moodButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            createMood(with: Emotion(state: .angry, color: .angryColor))
        case 2:
            createMood(with: Emotion(state: .annoyed, color: .annoyedColor))
        case 3:
            createMood(with: Emotion(state: .sad, color: .sadColor))
        case 4:
            createMood(with: Emotion(state: .meh, color: .mehColor))
        case 5:
            createMood(with: Emotion(state: .happy, color: .happyColor))
        case 6:
            createMood(with: Emotion(state: .excited, color: .excitedColor))
        default:
            print("No mood selected")
        }
    }
    
    func createMood(with emotion: Emotion) {
        let newMood = Mood(emotion: emotion, comment: nil, date: date)
        navigateToCommentVC(with: newMood)
    }

    func navigateToCommentVC(with mood: Mood) {
        //create intance of next VC
        let addCommentVC = CommentViewController()
        //pass mood to next VC
        addCommentVC.mood = mood
        //present next VC
        //present(addCommentVC, animated: true, completion: nil)
        performSegue(withIdentifier: "MoodCommentSegue", sender: self)
    }

}
