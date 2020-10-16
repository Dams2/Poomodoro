//
//  WorkTimeViewModel.swift
//  watchTest WatchKit Extension
//
//  Created by Damien Rojo on 14.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class WorkTimeViewModel {
    
    // MARK: - Inputs
    
    var workText: inputVoid<String>?
    var duration: inputVoid<Double>?
    
    // MARK: - Outputs
    
    func viewDidLoad() {
        workText?("Concentrate on your work 💪")
        duration?(workTime)
    }
}
