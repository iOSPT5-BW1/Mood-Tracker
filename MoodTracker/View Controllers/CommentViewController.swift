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
    
    var mood: MoodTracker?
    var moodController: MoodModelController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBActions
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        guard let comment = commentTextView.text, !comment.isEmpty else { return }
        guard let mood = mood?.mood else { return }
        guard let date = moodController?.getDate() else { return }
        guard let color = moodColor(rawValue: "red") else { return }
        
        moodController?.createMood(mood: mood, comment: comment, date: date, color: color)
        
        
        dismiss(animated: true, completion: nil)
    }
    
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    

}
