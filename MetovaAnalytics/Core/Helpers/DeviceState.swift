//
//  MetovaAnalytics.swift
//  MetovaAnalytics
//
//  Created by Nick Griffith on 7/23/18
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

import UIKit.UIDevice

extension AnalyticsEvent.MetadataKey {
    /// Keys available for the default metadata provided by the base AnalyticsEvent class relating to the current state of the device
    public struct DeviceState {
        private init() {}
        
        private static let prefix = "\(AnalyticsEvent.MetadataKey.prefix)_ds"
        
        /// The orientation the current device is rotated to
        public static let orientation = "\(prefix)_orientation"
        /// The current state of the battery
        public static let batteryState = "\(prefix)_batteryState"
        /// The current charge level of the battery
        public static let batteryLevel = "\(prefix)_batteryLevel"
    }
}

extension UIDevice {
    
    internal var analyticsInfo: [String: String] {
        return [
            AnalyticsEvent.MetadataKey.DeviceState.orientation: orientationDescription,
            AnalyticsEvent.MetadataKey.DeviceState.batteryState: batteryStateDescription,
            AnalyticsEvent.MetadataKey.DeviceState.batteryLevel: batteryLevelDescription,
        ]
    }
    
    private var orientationDescription: String {
        
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            return "portrait"
        case .landscapeLeft, .landscapeRight:
            return "landscape"
        case .faceUp:
            return "face up"
        case .faceDown:
            return "face down"
        case .unknown:
            return "unknown"
        }
    }
    
    private var batteryStateDescription: String {
        
        switch UIDevice.current.batteryState {
        case .unplugged:
            return "on battery, discharging"
        case .charging:
            return "plugged in, less than 100%"
        case .full:
            return "plugged in, at 100%"
        case .unknown:
            return "unknown"
        }
    }
 
    private var batteryLevelDescription: String {
        
        return String(format: "%0.2f", UIDevice.current.batteryLevel)
    }
}
