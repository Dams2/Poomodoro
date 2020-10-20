//
//  PauseTimeViewController.swift
//  Poomodoro WatchKit Extension
//
//  Created by Damien Rojo on 13.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import WatchKit
import Foundation

final class PauseTimeViewController: WKInterfaceController {
    
    // MARK: - Private Properties
    
    private var viewModel: PauseTimeViewModel!
    private var timer: Timer?
    
    // MARK: - Outlets
    
    @IBOutlet weak private var pauseTimer: WKInterfaceTimer!
    @IBOutlet weak private var pauseLabel: WKInterfaceLabel!

    // MARK: - View life cycle

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        viewModel = PauseTimeViewModel()
        bind(to: viewModel)
        viewModel.viewDidLoad()
        pauseTimer.start()

    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    // MARK: - Helpers

    private func bind(to viewModel: PauseTimeViewModel) {
        viewModel.pauseText = { [weak self] text in
            DispatchQueue.main.async {
            self?.pauseLabel.setText(text)
            }
        }
        
        viewModel.duration = { duration in
            DispatchQueue.main.async {
                self.pauseTimer.setDate(Date(timeIntervalSinceNow: 5.0))
                self.timer = Timer.scheduledTimer(timeInterval: 5.0,
                                              target: self,
                                              selector: #selector(self.timerDone),
                                              userInfo: nil,
                                              repeats: false)
                guard let timer = self.timer else { return }
                RunLoop.current.add(timer, forMode: .common)
            }
        }
    }

    @objc private func timerDone() {
        pauseCounter += 1
        WKInterfaceDevice.current().play(.notification)
        presentHomeViewController()
    }
}
