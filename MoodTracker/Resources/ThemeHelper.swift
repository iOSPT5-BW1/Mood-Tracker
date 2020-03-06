//
//  ThemeHelper.swift
//  MoodTracker
//
//  Created by Juan M Mariscal on 2/29/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreference: String? {
        get {
            return UserDefaults.standard.string(forKey: .themePreferenceKey)
        }
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToWhite()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(String.darkNotificationKey, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToWhite() {
        UserDefaults.standard.set(String.lightNotificationKey, forKey: .themePreferenceKey)
    }
}
