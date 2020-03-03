//
//  MoodTableViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class MoodTableViewController: UITableViewController, ThemeDelegate {
    
    func setTheme() {
        var color: UIColor
        
        switch themeHelper.themePreference {
        case "Dark":
            color = .darkGray
        case "White":
            color = .white
        default:
            return
        }
        self.moodTableView.backgroundColor = color
    }
    
    var moodModelController = MoodModelController()
    var mood: Mood?
    let themeHelper = ThemeHelper()
    
    @IBOutlet var moodTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        moodModelController.newMoodDelegate = self
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        setTheme()

    
    @IBOutlet weak var addButton: UIBarButtonItem!
    

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
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "TrackingCommentSegue" {
//            if let indexPath = tableView.indexPathForSelectedRow,
//                let editMoodVC = segue.destination as? CommentViewController {
//                let mood = moodModelController.moods[indexPath.row]
//                editMoodVC.mood = mood
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "MoodPickerSegue" {
            let navController = segue.destination as! UINavigationController
            let moodPickerVC = navController.topViewController as? MoodPickerViewController
            moodPickerVC?.moodController = moodModelController
        } else if segue.identifier == "ThemeSelectSegue" {
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
            themeSelectionVC.themeHelper = themeHelper
            themeSelectionVC.delegate = self
        }
    }
    
    func themeSelected() {
        setTheme()
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
