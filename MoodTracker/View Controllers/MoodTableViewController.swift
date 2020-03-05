//
//  MoodTableViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class MoodTableViewController: UITableViewController {
    
    
    var moodModelController = MoodModelController()
    var mood: Mood?
    let themeHelper = ThemeHelper()
    //let light = Notification.Name(rawValue: .themePreferenceKey)
    lazy var theme = Notification.Name(rawValue: themeHelper.themePreference ?? .darkNotificationKey)
    
    @IBOutlet var moodTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        moodModelController.newMoodDelegate = self
        createObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        theme = Notification.Name(rawValue: themeHelper.themePreference ?? .lightNotificationKey)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    
    //@IBOutlet weak var addButton: UIBarButtonItem!
    

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
            //themeSelectionVC?.delegate = self
        }
    }
    
    // MARK: NSNotification Observers
    
    func createObservers() {
        
        //Light
        //NotificationCenter.default.addObserver(self, selector: #selector(MoodTableViewController.updateTheme(notification:)), name: theme, object: nil)
        
        //Dark
        NotificationCenter.default.addObserver(self, selector: #selector(MoodTableViewController.updateTheme(notification:)), name: theme, object: nil)
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
    

    
//    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let moodPickerVC: UIViewController = storyboard.instantiateViewController(identifier: "MoodPickerVC") as! MoodPickerViewController
//        let navController = UINavigationController(rootViewController: moodPickerVC)
//        present(navController, animated: true)
//    }
    
}

extension MoodTableViewController: AddNewMoodDelegate {
    
    func updateWithNewMood() {
        tableView.reloadData()
    }
}
