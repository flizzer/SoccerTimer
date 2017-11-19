//
//  ViewController.swift
//  SoccerTimer
//
//  Created by Brian Davis on 10/20/17.
//  Copyright © 2017 Brian Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerDisplay: UILabel!
    
    var date = Date()
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "mm:ss"
        date = dateFormatter.date(from: "08:00")!
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
        Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: (#selector(ViewController.updateTimerDisplay)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimerDisplay()
    {
        date.addTimeInterval(-1)
        let updatedTime = dateFormatter.string(from: date)
        timerDisplay.text = updatedTime
    }
}

