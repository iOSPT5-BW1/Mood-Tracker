//
//  MoodTableViewCell.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet var dateLabel: UILabel!
    
    
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
        dateLabel.text = moodController?.getDate()
    }

    
    //MARK: IBActions
    @IBAction func editButtonTapped(_ sender: Any) {
        
    }
    

}
