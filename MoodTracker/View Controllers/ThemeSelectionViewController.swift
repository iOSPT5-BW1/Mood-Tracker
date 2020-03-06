//
//  ThemeSelectionViewController.swift
//  MoodTracker
//
//  Created by Juan M Mariscal on 2/29/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    @IBOutlet weak var darkThemeBtn: UIButton!
    @IBOutlet weak var lightThemeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkThemeBtn.layer.cornerRadius = 5.0
        lightThemeBtn.layer.cornerRadius = 5.0

    }
    
    @IBAction func darkThemeBtnTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        let name = Notification.Name(rawValue: themeHelper?.themePreference ?? .darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func whiteThemeBtnTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToWhite()
        let name = Notification.Name(rawValue: themeHelper?.themePreference ?? .lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
}
