//
//  SettingsViewModel.swift
//  Poomodoro WatchKit Extension
//
//  Created by Damien Rojo on 16.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class SettingsViewModel {

    // MARK: - Inputs

    var configurationsText: inputVoid<String>?
    var firstConfigurationText: inputVoid<String>?
    var secondConfigurationText: inputVoid<String>?
    var thirdConfigurationText: inputVoid<String>?
    var fourthConfigurationsText: inputVoid<String>?

    // MARK: - Outputs

    func viewDidLoad() {
        configurationsText?("Configurations")
        firstConfigurationText?("30/5")
        secondConfigurationText?("45/5")
        thirdConfigurationText?("45/10")
        fourthConfigurationsText?("60/10")
    }
    
    func didPressFirstConfiguration() {
        configureTime(workTimeConfiguration: 1800.0,
                      pauseTimeConfiguration: 300.0)
    }
    
    func didPressSecondConfiguration() {
        configureTime(workTimeConfiguration: 2700.0,
                      pauseTimeConfiguration: 300.0)
    }
    
    func didPressThirdConfiguration() {
        configureTime(workTimeConfiguration: 2700.0,
                      pauseTimeConfiguration: 600.0)
    }
    
    func didPressFourthConfiguration() {
        configureTime(workTimeConfiguration: 3600.0,
                      pauseTimeConfiguration: 600.0)
    }
    
    // MARK: - Helpers
    
    private func configureTime(workTimeConfiguration: Double,
                               pauseTimeConfiguration: Double) {
        workTime = workTimeConfiguration
        pauseTime = pauseTimeConfiguration
    }
}
