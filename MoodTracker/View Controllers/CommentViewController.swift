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
    var theme = ThemeSelectionViewController()
    let light = Notification.Name(rawValue: .lightNotificationKey)
    let dark = Notification.Name(rawValue: .darkNotificationKey)
    
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
        createObservers()

    }
    

    func updateViews() {
        commentTextView.text = mood.comment
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
    
    func createObservers() {
        
        //Light
        NotificationCenter.default.addObserver(self, selector: #selector(CommentViewController.updateTheme(notification:)), name: light, object: nil)
        
        //Dark
        NotificationCenter.default.addObserver(self, selector: #selector(CommentViewController.updateTheme(notification:)), name: dark, object: nil)
    }
    
    @objc func updateTheme(notification: NSNotification) {
        
        let isLight = notification.name == light
        let color = isLight ? UIColor.white : UIColor.darkGray
        view.backgroundColor = color
    }
    

}
