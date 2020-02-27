//
//  MoodModelController.swift
//  MoodTracker
//
//  Created by Juan M Mariscal on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class MoodModelController {
    
    //MARK: - Properties
    var moods: [MoodTracker] = []
    
    var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    init() {
        loadFromPersistentStore()
    }
    
    
    //MARK: - CRUD Functions
    func createMood(mood: Mood, comment: String, date: String, color: moodColor) {
        let newMood = MoodTracker(mood: mood, comment: comment, date: date, color: color)
        
        moods.append(newMood)
        saveToPersistentStore()
    }
    
    
    //MARK: - Helper Functions
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        let currentDate = formatter.string(from: Date())
        return currentDate
    }
    
    
    
    // MARK: Save, Load from Persistent
    private var persistentFileURL: URL? {
      let fileManager = FileManager.default
      guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
       
      return documents.appendingPathComponent("mood.plist")
    }
    
    func saveToPersistentStore() {
        
        // Stars -> Data -> Plist
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(moods)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        // Plist -> Data -> Stars
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            moods = try decoder.decode([MoodTracker].self, from: data)
        } catch {
            print("error loading stars data: \(error)")
        }
    }
}
