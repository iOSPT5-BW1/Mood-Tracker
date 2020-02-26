//
//  Mood.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation
import UIKit

enum Moods: String {
    case angry
    case sad
    case happy
    case excited
    case annoyed
    case meh
}

//TODO: - figure out color enum
enum colors: String {
    case angry = "red"
    case sad = "blue"
    case happy = "green"
    case excited = "yellow"
    case annoyed = "orange"
    case meh = "brown"
}

struct ModelTracker {
    var mood: Moods
    var comment: String
    var date: Date
    var color: colors
}
