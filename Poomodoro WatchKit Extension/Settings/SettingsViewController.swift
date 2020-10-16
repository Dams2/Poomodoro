//
//  SettingsViewController.swift
//  watchTest WatchKit Extension
//
//  Created by Damien Rojo on 13.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import WatchKit
import Foundation

final class SettingsViewController: WKInterfaceController {
    
    // MARK: - Properties

    private var viewModel: SettingsViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet weak private var configurationsLabel: WKInterfaceLabel!
    
    @IBOutlet weak private var firstConfigurationButton: WKInterfaceButton!
    
    @IBOutlet weak private var secondConfigurationButton: WKInterfaceButton!
    
    @IBOutlet weak private var thirdConfigurationButton: WKInterfaceButton!
    
    @IBOutlet weak private var fourthConfigurationButton: WKInterfaceButton!
    
    // MARK: - View life cycle
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        viewModel = SettingsViewModel()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
        
    }
    
    // MARK: - Helpers

    private func bind(to viewModel: SettingsViewModel) {
        viewModel.configurationsText = { [weak self] text in
            DispatchQueue.main.async {
                self?.configurationsLabel.setText(text)
            }
        }

        viewModel.firstConfigurationText = { [weak self] text in
            DispatchQueue.main.async {
                self?.firstConfigurationButton.setTitle(text)
            }
        }

        viewModel.secondConfigurationText = { [weak self] text in
            DispatchQueue.main.async {
                self?.secondConfigurationButton.setTitle(text)
            }
        }

        viewModel.thirdConfigurationText = { [weak self] text in
            DispatchQueue.main.async {
                self?.thirdConfigurationButton.setTitle(text)
            }
        }

        viewModel.fourthConfigurationsText = { [weak self] text in
            DispatchQueue.main.async {
                self?.fourthConfigurationButton.setTitle(text)
            }
        }
    }
    
    // MARK: - Actions
    
 
    @IBAction private func didPressFirstConfigurationButton() {
        viewModel.didPressFirstConfiguration()
        presentHomeViewController()
    }
    
    @IBAction private func didPressSecondConfigurationButton() {
        viewModel.didPressSecondConfiguration()
        presentHomeViewController()
    }
    
    @IBAction private func didPressThirdConfigurationButton() {
        viewModel.didPressThirdConfiguration()
        presentHomeViewController()
    }
    
    @IBAction private func didPressFourthConfigurationButton() {
        viewModel.didPressFourthConfiguration()
        presentHomeViewController()
    }
}
