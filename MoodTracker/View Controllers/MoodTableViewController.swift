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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodModelController.moods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoodCell", for: indexPath) as? MoodTableViewCell else { return UITableViewCell() }
        let mood = moodModelController.moods[indexPath.row]
        cell.mood = mood
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
    
}
