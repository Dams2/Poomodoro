//
//  WorkTimeViewController.swift
//  Poomodoro WatchKit Extension
//
//  Created by Damien Rojo on 13.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import WatchKit
import Foundation

final class WorkTimeViewController: WKInterfaceController, WKExtensionDelegate {
    
    // MARK: - Private Properties

    private var extensionDelegate = ExtensionDelegate()
    private var viewModel: WorkTimeViewModel!
    private var timer: Timer?
    
    // MARK: - Outlets
    
    @IBOutlet weak private var workTimer: WKInterfaceTimer!
    @IBOutlet weak private var workLabel: WKInterfaceLabel!

    // MARK: - View life cycle

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        viewModel = WorkTimeViewModel()
        bind(to: viewModel)
        viewModel.viewDidLoad()
        workTimer.start()
    }

    override func willActivate() {
        super.willActivate()
        
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    // MARK: - Helpers
    
    private func bind(to viewModel: WorkTimeViewModel) {
        viewModel.workText = { [weak self] text in
            DispatchQueue.main.async {
                self?.workLabel.setText(text)
            }
        }

        viewModel.duration = { duration in
            DispatchQueue.main.async {
                self.workTimer.setDate(Date(timeIntervalSinceNow: duration))
                self.timer = Timer.scheduledTimer(timeInterval: duration,
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
        workCounter += 1
        WKInterfaceDevice.current().play(.notification)
        presentPauseTimeViewController()
    }
}
