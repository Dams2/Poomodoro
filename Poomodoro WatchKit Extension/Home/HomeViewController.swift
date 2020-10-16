//
//  HomeViewController.swift
//  watchTest WatchKit Extension
//
//  Created by Damien Rojo on 13.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import WatchKit
import Foundation

final class HomeViewController: WKInterfaceController {

    // MARK: - Private Properties

    private var viewModel: HomeViewModel!

    // MARK: - Outlets

    @IBOutlet weak private var settingsButton: WKInterfaceButton!
    @IBOutlet weak private var statisticsLabel: WKInterfaceLabel!
    @IBOutlet weak private var workTimeLabel: WKInterfaceLabel!
    @IBOutlet weak private var workTimeAmountLabel: WKInterfaceLabel!
    @IBOutlet weak private var pauseTimeLabel: WKInterfaceLabel!
    @IBOutlet weak private var pauseTimeAmountLabel: WKInterfaceLabel!
    @IBOutlet weak private var startButton: WKInterfaceButton!

    // MARK: - View life cycle

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        viewModel = HomeViewModel()
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

    private func bind(to viewModel: HomeViewModel) {
        viewModel.settingsText = { [weak self] text in
            DispatchQueue.main.async {
                self?.settingsButton.setBackgroundImage(UIImage(systemName: text))
            }
        }

        viewModel.statisticsText = { [weak self] text in
           DispatchQueue.main.async {
            self?.statisticsLabel.setText(text)
           }
        }

        viewModel.workTimeText = { [weak self] text in
           DispatchQueue.main.async {
            self?.workTimeLabel.setText(text)
           }
        }
        
        viewModel.workTimeAmountText = { [weak self] text in
           DispatchQueue.main.async {
            self?.workTimeAmountLabel.setText(text)
           }
        }
        
        viewModel.pauseTimeText = { [weak self] text in
           DispatchQueue.main.async {
            self?.pauseTimeLabel.setText(text)
           }
        }
        
        viewModel.pauseTimeAmountText = { [weak self] text in
           DispatchQueue.main.async {
            self?.pauseTimeAmountLabel.setText(text)
           }
        }
        
        viewModel.startText = { [weak self] text in
           DispatchQueue.main.async {
            self?.startButton.setTitle(text)
           }
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func didPressStartButton() {
        WKInterfaceDevice.current().play(.start)
        presentWorkTimeViewController(viewController: self)
    }

    @IBAction private func didPressSettingsButton() {
        presentSettingsViewController(viewController: self)
    }
}
