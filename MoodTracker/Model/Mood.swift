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

enum Color: String, Codable {
    case angryColor = "angryColor"
    case annoyedColor = "annoyedColor"
    case sadColor = "sadColor"
    case mehColor = "mehColor"
    case happyColor = "happyColor"
    case excitedColor = "excitedColor"
}

struct MoodTracker: Codable {
    var mood: Mood
    let comment: String
    let date: Date
    let color: Color
    
    init (mood: Mood, comment: String, date: Date, color: Color){
        self.mood = mood
        self.comment = comment
        self.date = date
        self.color = color
    }
    
    //Use this computed property when you want to GET and USE the color i.e. tableView, etc.
    var moodColor: UIColor {
        switch color {
        case .angryColor:
            return UIColor.angryColor
        case .annoyedColor:
            return UIColor.annoyedColor
        case .sadColor:
            return UIColor.sadColor
        case .mehColor:
            return UIColor.mehColor
        case .happyColor:
            return UIColor.happyColor
        case .excitedColor:
            return UIColor.excitedColor
        }
    }
}
