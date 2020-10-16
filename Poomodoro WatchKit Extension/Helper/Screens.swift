//
//  Screens.swift
//  watchTest WatchKit Extension
//
//  Created by Damien Rojo on 14.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import WatchKit

extension WKInterfaceController {

    func presentHomeViewController() {
        WKInterfaceDevice.current().play(.success)
        WKInterfaceController.reloadRootPageControllers(withNames: ["HomeViewController"],
                                                        contexts: nil,
                                                        orientation: .vertical,
                                                        pageIndex: 0)
    }

    func presentSettingsViewController(viewController: WKInterfaceController) {
        viewController.pushController(withName: "SettingsViewController", context: nil)

    }

    func presentWorkTimeViewController(viewController: WKInterfaceController) {
        viewController.pushController(withName: "WorkTimeViewController", context: nil)
    }

    func presentPauseTimeViewController() {
        WKInterfaceController.reloadRootPageControllers(withNames: ["PauseTimeViewController"],
                                                        contexts: nil,
                                                        orientation: .vertical,
                                                        pageIndex: 0)
    }
}
