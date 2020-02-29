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
    var moodController: MoodModelController?
    
//    init?(coder: NSCoder, mood: Mood, moodController: MoodModelController) {
//        self.mood = mood
//        self.moodController = moodController
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("must create VC with a mood")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(mood)
//        print(mood.emotion)
    }
    
    // MARK: IBActions
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        let comment = commentTextView!.text ?? ""
        if let emotion = mood?.emotion,
            let date = mood?.date {
            moodController?.createMood(emotion: emotion, comment: comment, date: date, color: emotion.color)
            print(mood)
        }
    }
    
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CommentQuoteSegue" {
            guard let quoteVC = segue.destination as? QuoteViewController else { return }
            quoteVC.mood = mood
        }
    }
    

}
