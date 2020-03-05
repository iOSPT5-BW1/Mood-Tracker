//
//  Shadow.swift
//  MoodTracker
//
//  Created by Matthew Martindale on 3/3/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

extension UIView {
    func moodPickerShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        clipsToBounds = false
    }
    
    func buttonShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 1
        clipsToBounds = false
    }
}
