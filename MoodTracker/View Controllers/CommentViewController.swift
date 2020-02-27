//
//  CommentViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

protocol AddCommentDelegate {
    func commentWasAdded(_ comment: MoodTracker)
}

class CommentViewController: UIViewController {
    
    

    @IBOutlet weak var commentTextView: UITextView!
    
    var delegate: AddCommentDelegate?
    
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
        
        var moodEntered = MoodTracker(mood: <#T##Mood#>, comment: <#T##String#>, date: <#T##Date#>, color: <#T##moodColor#>)
        
        delegate?.commentWasAdded(moodEntered)
        
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
