//
//  MoodTableViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit
import UserNotifications

class MoodTableViewController: UITableViewController {
    
    var moodModelController = MoodModelController()
    var mood: Mood?
    let themeHelper = ThemeHelper()
    let light = Notification.Name(rawValue: .lightNotificationKey)
    let dark = Notification.Name(rawValue: .darkNotificationKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodModelController.newMoodDelegate = self
        createObservers()
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!!")
            } else {
                print("Boo")
            }
        }
        scheduleNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodModelController.moods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoodCell", for: indexPath) as? MoodTableViewCell else { return UITableViewCell() }
        let mood = moodModelController.moods[indexPath.row]
        cell.mood = mood
        cell.moodController = moodModelController
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let mood = moodModelController.moods[indexPath.row]
            moodModelController.deleteMood(moodToDelete: mood)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moodToUpdate = moodModelController.moods[indexPath.row]
        guard let commentVC = storyboard?.instantiateViewController(identifier: "EditCommentVC", creator: { coder in
            return EditCommentViewController(coder: coder, mood: moodToUpdate, moodController: self.moodModelController)
        }) else { fatalError("failed to load commentVC from storyboard")}
        navigationController?.pushViewController(commentVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MoodPickerSegue" {
            let navController = segue.destination as! UINavigationController
            let moodPickerVC = navController.topViewController as? MoodPickerViewController
            moodPickerVC?.moodController = moodModelController
        } else if segue.identifier == "ThemeSelectSegue" {
            let navController = segue.destination as! UINavigationController
            let themeSelectionVC = navController.topViewController as? ThemeSelectionViewController
            themeSelectionVC?.themeHelper = themeHelper
        }
    }
    
    // MARK: NSNotification Observers
    func createObservers() {
        //Light
        NotificationCenter.default.addObserver(self, selector: #selector(MoodTableViewController.updateTheme(notification:)), name: light, object: nil)
        
        //Dark
        NotificationCenter.default.addObserver(self, selector: #selector(MoodTableViewController.updateTheme(notification:)), name: dark, object: nil)
    }
    
    @objc func updateTheme(notification: NSNotification) {
        
        let isLight = notification.name == light
        let color = isLight ? UIColor.white : UIColor.darkMode
        view.backgroundColor = color
        if !isLight {
            navigationController?.navigationBar.tintColor = .sadColor
        } else {
            navigationController?.navigationBar.tintColor = .blue
        }
    }
    
    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "How's your day so far?"
        content.body = "Track your mood for today and leave yourself a comment."
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
        let trigger10Secs = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            //Use this trigger for daily notifications and the dateComponents to change the time.
//        let dailyTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger10Secs)
        
        center.add(request) { (error) in
            
        }
    }
    
}

extension MoodTableViewController: AddNewMoodDelegate {
    func updateWithNewMood() {
        tableView.reloadData()
    }
}
