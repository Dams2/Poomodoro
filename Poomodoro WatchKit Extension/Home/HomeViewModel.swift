//
//  HomeViewModel.swift
//  Poomodoro WatchKit Extension
//
//  Created by Damien Rojo on 13.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class HomeViewModel {

    // MARK: - Inputs

    var settingsText: inputVoid<String>?
    var statisticsText: inputVoid<String>?
    var workTimeText: inputVoid<String>?
    var workTimeAmountText: inputVoid<String>?
    var pauseTimeText: inputVoid<String>?
    var pauseTimeAmountText: inputVoid<String>?
    var startText: inputVoid<String>?

    // MARK: - Outputs

    func viewDidLoad() {
        settingsText?("gear")
        statisticsText?("Statistics")
        workTimeText?("Work time:")
        workTimeAmountText?(counter(time: workTime, count: workCounter))
        pauseTimeText?("Pause time:")
        pauseTimeAmountText?(counter(time: pauseTime, count: workCounter))
        startText?("Start")
    }
    
    // MARK: - Helpers
    
    private func counter(time: Double, count: Double) -> String {
        let totalTime = time * count
        var result = ""
        if totalTime <= 59 {
            result = "\(totalTime)m"
        } else {
            let coversion = totalTime / 60
            result = "\(coversion)h"
        }
        return result
    }
}
