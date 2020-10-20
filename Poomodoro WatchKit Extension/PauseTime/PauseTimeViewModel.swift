//
//  PauseTimeViewModel.swift
//  Poomodoro WatchKit Extension
//
//  Created by Damien Rojo on 14.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class PauseTimeViewModel {

    // MARK: - Inputs

    var pauseText: inputVoid<String>?
    var duration: inputVoid<Double>?

    // MARK: - Outputs

    func viewDidLoad() {
        pauseText?("Well done ! Now rest 😎")
        duration?(pauseTime)
    }
}
