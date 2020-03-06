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
    
    var mood: Mood {
        didSet {
            updateViews()
        }
    }
    var moodController: MoodModelController
    let themeHelper = ThemeHelper()
    let light = Notification.Name(rawValue: .lightNotificationKey)
    let dark = Notification.Name(rawValue: .darkNotificationKey)
    
    // MARK: IBOutlets
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    init?(coder: NSCoder, mood: Mood, moodController: MoodModelController) {
        self.mood = mood
        self.moodController = moodController
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("must create VC with a mood")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextView.becomeFirstResponder()
        updateViews()
        cancelBtn.layer.cornerRadius = 5.0
        saveBtn.layer.cornerRadius = 5.0
    }
    

    func updateViews() {
        commentTextView.text = mood.comment
        checkTheme()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        commentTextView.becomeFirstResponder()
//    }
    
    // MARK: IBActions
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        if let comment = commentTextView.text {
            let emotion = mood.emotion
            let date = mood.date
            moodController.createMood(emotion: emotion, comment: comment, date: date, color: emotion.color)
            moodController.newMoodDelegate?.updateWithNewMood()
        }
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CommentQuoteSegue" {
            guard let quoteVC = segue.destination as? QuoteViewController else { return }
            quoteVC.mood = mood
            
        }
    }
    
    // MARK: NSNotification Observers
    
    func checkTheme() {
        if themeHelper.themePreference == .darkNotificationKey {
            view.backgroundColor = .darkMode
        }
    }

}
