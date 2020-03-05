//
//  ThemeSelectionViewController.swift
//  MoodTracker
//
//  Created by Juan M Mariscal on 2/29/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

//protocol ThemeDelegate {
//    func themeSelected(color: UIColor)
//}

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    //var delegate: ThemeDelegate!
    let theme = Notification.Name(rawValue: .themePreferenceKey)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    @IBAction func darkThemeBtnTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        let name = Notification.Name(rawValue: themeHelper?.themePreference ?? .darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        //delegate?.themeSelected(color: .darkGray)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func whiteThemeBtnTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToWhite()
        let name = Notification.Name(rawValue: themeHelper?.themePreference ?? .lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        //delegate?.themeSelected(color: .white)
        dismiss(animated: true, completion: nil)
    }
    
    func createObservers() {
            
            //Light
            //NotificationCenter.default.addObserver(self, selector: #selector(MoodTableViewController.updateTheme(notification:)), name: theme, object: nil)
            
            //Dark
            NotificationCenter.default.addObserver(self, selector: #selector(ThemeSelectionViewController.updateTheme(notification:)), name: theme, object: nil)
        }
        
        @objc func updateTheme(notification: NSNotification) {
            if notification.name == theme {
                if theme.rawValue == .darkNotificationKey {
                    view.backgroundColor = .darkGray
                } else if theme.rawValue == .lightNotificationKey {
                    view.backgroundColor = .white
                }
            } else { return }
    //        let isLight = notification.name == light
    //        let color = isLight ? UIColor.white : UIColor.darkGray
    //        view.backgroundColor = color
        }
}
