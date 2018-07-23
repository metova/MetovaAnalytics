//
//  MetovaAnalytics.swift
//  MetovaAnalytics
//
//  Created by Nick Griffith on 7/19/18
//  Copyright © 2018 Metova. All rights reserved.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation

open class AnalyticsEvent {
    
    public init() {}
    
    open var name: String {
        fatalError("AnalyticsEvent is an abstract class.  Name must be provided by a subclass.")
    }
    
    open var metadata: [String: String] {
        return [:]
            .merging(deviceState) { (_, new) in new }
            .merging(deviceInfo) { (_, new) in new }
            .merging(preferredLocalization) { (_, new) in new }
            .merging(applicationInformation) { (_, new) in new }
    }

    private var deviceState: [String: String] {
        return [
            "DeviceState_Orientation": UIDevice.current.orientationDescription,
            "DeviceState_BatteryState": UIDevice.current.batteryStateDescription,
            "DeviceState_BatteryLevel": UIDevice.current.batteryLevelDescription,
        ]
    }
    
    lazy private var applicationInformation: [String: String] = {
        return Bundle.main.analyticsAppInfo
    }()
    
    lazy private var preferredLocalization: [String: String] = {
        return NSLocale.analyticsInfo
    }()

    private lazy var deviceInfo: [String: String] = {
        return UIDevice.analyticsInfo
    }()
    

}
