//
//  Closures.swift
//  Poomodoro WatchKit Extension
//
//  Created by Damien Rojo on 13.10.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

public typealias inputVoid<T> = ((_: T) -> Void)
public var workCounter = 0.0
public var pauseCounter = 0.0
public var workTime = 1800.0
public var pauseTime = 300.0
