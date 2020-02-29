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
    var moods: [Mood] = []
    
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

    func createMood(emotion: Emotion, comment: String?, date: Date, color: Color) {

        let newMood = Mood(emotion: emotion, comment: nil, date: date)
        
        moods.append(newMood)
        saveToPersistentStore()
    }
    
    
    //MARK: - Helper Functions
    func getDate() -> String {
        let formatter = DateFormatter()
        //formatter.dateFormat = "MMM d yyyy"
        let currentDate = formatter.string(from: Date())
        print("date: \(currentDate)")
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
            moods = try decoder.decode([Mood].self, from: data)
        } catch {
            print("error loading stars data: \(error)")
        }
    }
}
