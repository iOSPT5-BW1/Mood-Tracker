//
//  QuoteAPI.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/28/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation
import UIKit

struct Quote: Codable {
    let title, author: String
    let url: String
    let media: String
    let cat: String
}
