//
//  MoodTableViewCell.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    //MARK: Properties
    var moodController: MoodModelController?
    
     var mood: Mood? {
           didSet {
               updateViews()
           }
       }
    
    
    //MARK: Functions
    func updateViews() {
        guard let mood = mood else { return }
        backgroundColor = mood.emotion.moodColor
        dateLabel.text = mood.dateString
        commentLabel.text = mood.comment
    }
}
