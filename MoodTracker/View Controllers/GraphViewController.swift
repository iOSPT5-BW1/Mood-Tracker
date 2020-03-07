//
//  GraphViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 3/3/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController {

    //MARK: - Properties
    var moodModelController = MoodModelController() 
    
    var angryData = PieChartDataEntry(value: 0)
    var happyData = PieChartDataEntry(value: 0)
    var sadData = PieChartDataEntry(value: 0)
    var excitedData = PieChartDataEntry(value: 0)
    var annoyedData = PieChartDataEntry(value: 0)
    var mehData = PieChartDataEntry(value: 0)
    
    var numberOfMoodDataEntries = [PieChartDataEntry]()
    
    let moodName = Notification.Name(rawValue: .moodAddedNotificationKey
    
    )
    //MARK: - IBOutlets
    @IBOutlet var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObserver()
        buildChart()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //MARK: - Functions
    func buildChart() {
        chartView.chartDescription?.text = ""
        
        for i in 0..<moodModelController.moods.count {
            let singleMood = moodModelController.moods[i]
            switch singleMood.emotion.state.rawValue {
            case "angry":
                angryData.value += 1
            case "happy":
                happyData.value += 1
            case "sad":
                sadData.value += 1
            case "excited":
                excitedData.value += 1
            case "annoyed":
                annoyedData.value += 1
            case "meh":
                mehData.value += 1
            default:
                print("Data not found")
            }
        }
        
        angryData.label = "angry"
        happyData.label = "happy"
        sadData.label = "sad"
        excitedData.label = "excited"
        annoyedData.label = "annoyed"
        mehData.label = "meh"
        
        numberOfMoodDataEntries = [angryData, happyData, sadData, excitedData, annoyedData, mehData]
        
        updateChartData()
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfMoodDataEntries)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        chartDataSet.colors = [UIColor(red: 255/255, green: 212/255, blue: 212/255, alpha: 1),
                      UIColor(red: 161/255, green: 245/255, blue: 192/255, alpha: 1),
                      UIColor(red: 202/255, green: 224/255, blue: 245/255, alpha: 1),
                      UIColor(red: 255/255, green: 246/255, blue: 165/255, alpha: 1),
                      UIColor(red: 255/255, green: 212/255, blue: 151/255, alpha: 1),
                      UIColor(red: 196/255, green: 169/255, blue: 158/255, alpha: 1)]
        
        chartView.data = chartData
        chartView.data?.setValueTextColor(.black)
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(GraphViewController.updateChart(notification:)), name: moodName, object: nil)
    }
    
    @objc func updateChart(notification: NSNotification){
        let moodController = notification.object as! MoodModelController
        print(moodController.moods)
        let lastMood = moodController.moods.last
        print(lastMood)
        switch lastMood!.emotion.state.rawValue {
        case "angry":
            angryData.value += 1
        case "happy":
            happyData.value += 1
        case "sad":
            sadData.value += 1
        case "excited":
            excitedData.value += 1
        case "annoyed":
            annoyedData.value += 1
        case "meh":
            mehData.value += 1
        default:
            print("Data not found")
        }
        
        numberOfMoodDataEntries = [angryData, happyData, sadData, excitedData, annoyedData, mehData]
        
        updateChartData()
    }

}
