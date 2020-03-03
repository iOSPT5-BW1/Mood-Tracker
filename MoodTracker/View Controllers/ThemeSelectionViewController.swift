//
//  ThemeSelectionViewController.swift
//  MoodTracker
//
//  Created by Juan M Mariscal on 2/29/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

protocol ThemeDelegate {
    func themeSelected()
}

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    var delegate: ThemeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func darkThemeBtnTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        delegate?.themeSelected()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func whiteThemeBtnTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToWhite()
        dismiss(animated: true, completion: nil)
    }
}
