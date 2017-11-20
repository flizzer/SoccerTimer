//
//  ViewController.swift
//  SoccerTimer
//
//  Created by Brian Davis on 10/20/17.
//  Copyright © 2017 Brian Davis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timerDisplay: UILabel!
    
    let minutesInQuarter = "08:00"
    let timeFormat = "mm:ss"
    let buzzerSound : SystemSoundID = 1005
    
    var date = Date()
    var dateFormatter = DateFormatter()
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = timeFormat
        date = dateFormatter.date(from: minutesInQuarter)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startButton(_ sender: UIButton)
    {
        runTimer()
    }
    
    func runTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
            selector: (#selector(ViewController.updateTimerDisplay))
                , userInfo: nil, repeats: true)
    }
    
    @objc func updateTimerDisplay()
    {
        date.addTimeInterval(-1)
        let updatedTime = dateFormatter.string(from: date)
        if (updatedTime == "00:00")
        {
            playBuzzer()
            timer.invalidate()
        }
        timerDisplay.text = updatedTime
    }
    
    func playBuzzer()
    {
        AudioServicesPlayAlertSound(buzzerSound)
    }
}

