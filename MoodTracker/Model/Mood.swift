//
//  Mood.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation
import UIKit

enum EmotionState: String, Codable {
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

struct Emotion: Codable {
    var state: EmotionState
    var color: Color

    
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

struct Mood: Codable, Equatable {
    
    let emotion: Emotion
    let comment: String?
    let date: Date
    
    init (emotion: Emotion, comment: String?, date: Date){
        self.emotion = emotion
        self.comment = comment
        self.date = date
    }
    
    var dateString: String {
        dateFormatter.string(from: date)
    }
    
    static func == (lhs: Mood, rhs: Mood) -> Bool {
        if lhs.date == rhs.date {
            return true
        } else {
            return false
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()
