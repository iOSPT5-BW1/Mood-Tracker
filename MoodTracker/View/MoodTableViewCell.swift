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
    
     var moodTracker: MoodTracker? {
           didSet {
               updateViews()
           }
       }
    
    
    //MARK: Functions
    func updateViews() {
        guard let moodTracker = moodTracker else { return }
        backgroundColor = UIColor(named: moodTracker.color.rawValue)
        dateLabel.text = moodController?.getDate()
    }

    
    //MARK: IBActions
    @IBAction func editButtonTapped(_ sender: Any) {
        
    }
    

}
