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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moodModelController.moods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoodCell", for: indexPath) as? MoodTableViewCell else { return UITableViewCell() }
        let mood = moodModelController.moods[indexPath.row]
        cell.mood = mood
        return cell
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMoodDetail" {
            let editMoodVC = segue.destination as! QuoteViewController
            //TODO: Need to connect either the controller or the mood to the detailViewController
        }
//            addBookVC.bookController = bookController
//
//        } else if segue.identifier == "showBookSegue" {
//            if let indexPath = tableView.indexPathForSelectedRow,
//            let showDetailVC = segue.destination as? BookDetailViewController {
//                showDetailVC.bookController = bookController
//                showDetailVC.book = bookFor(indexPath: indexPath)
//            }
//        }
    }
    

}
