//
//  CommentViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentTextView: UITextView!
    
    var mood: Mood?
    var moodController = MoodModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBActions
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        if let newComment = commentTextView.text,
        let emotion = mood?.emotion,
            let date = mood?.date {
            moodController.createMood(emotion: emotion, comment: newComment, date: date, color: emotion.color)
        }
        present(MoodTableViewController(), animated: true, completion: nil)
        //performSegue(withIdentifier: "MoodTableViewSegue", sender: self)
    }
    
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    

}
