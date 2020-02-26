//
//  Mood.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation
import UIKit

enum Mood: String, Codable {
    case angry
    case sad
    case happy
    case excited
    case annoyed
    case meh
}

//TODO: - figure out color enum
enum moodColor: String, Codable {
    case angry = "red"
    case sad = "blue"
    case happy = "green"
    case excited = "yellow"
    case annoyed = "orange"
    case meh = "brown"
}

struct MoodTracker: Codable {
    var mood: Mood
    var comment: String
    var date: Date
    var color: moodColor
    
    init (mood: Mood, comment: String, date: Date, color: moodColor){
        self.mood = mood
        self.comment = comment
        self.date = date
        self.color = color
    }
}
