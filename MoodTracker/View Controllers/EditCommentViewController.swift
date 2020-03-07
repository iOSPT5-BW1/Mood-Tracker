//
//  EditCommentViewController.swift
//  MoodTracker
//
//  Created by Matthew Martindale on 3/2/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class EditCommentViewController: UIViewController {

    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var clearTxtBtn: UIButton!
    
    let themeHelper = ThemeHelper()
    
    init?(coder: NSCoder, mood: Mood, moodController: MoodModelController) {
           self.mood = mood
           self.moodController = moodController
           super.init(coder: coder)
       }

       required init?(coder: NSCoder) {
           fatalError("must create VC with a mood")
       }
    
    
    var mood: Mood {
        didSet {
            updateView()
        }
    }
    
    var moodController: MoodModelController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        clearTxtBtn.layer.cornerRadius = 5.0
        updateBtn.layer.cornerRadius = 5.0
    }
    
    @IBAction func clearTextBtnPressed(_ sender: Any) {
        commentTextView.text = ""
        commentTextView.becomeFirstResponder()
    }
    
    @IBAction func updateBtnPressed(_ sender: Any) {
        moodController?.updateMoodComment(mood: mood, comment: commentTextView.text)
        navigationController?.popViewController(animated: true)
    }
    
    func updateView() {
        commentTextView.text = mood.comment
        checkTheme()
    }
    
    func checkTheme() {
        if themeHelper.themePreference == .darkNotificationKey {
            view.backgroundColor = .darkMode
        }
    }
}
