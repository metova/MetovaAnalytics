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
    /// Keys available for the default metadata provided by the base AnalyticsEvent class relating to
    public struct DeviceInfo {
        private init() {}
        
        private static let prefix = "\(AnalyticsEvent.MetadataKey.prefix)_di"
        
        /// The idiomatic model name of the device
        public static let deviceModel = "\(prefix)_deviceModel"
        /// The public, common name of the device
        public static let deviceName = "\(prefix)_deviceName"
        /// The name of the operating system installed on the device
        public static let osName = "\(prefix)_OSName"
        /// The version of the operating system installed on the device
        public static let osVersion = "\(prefix)_OSVersion"
    }
}

private var deviceModelName: String = {
    // StackOverflow: https://stackoverflow.com/a/11197770/2792531
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
    }
    return identifier
}()

extension UIDevice {
    
    internal static var analyticsInfo: [String: String] {
        
        return [
            AnalyticsEvent.MetadataKey.DeviceInfo.osName: self.current.systemName,
            AnalyticsEvent.MetadataKey.DeviceInfo.osVersion: self.current.systemVersion,
            AnalyticsEvent.MetadataKey.DeviceInfo.deviceModel: self.modelName,
            AnalyticsEvent.MetadataKey.DeviceInfo.deviceName: self.deviceName,
        ]
    }
    
    private static var modelName: String {
        
        return deviceModelName
    }
    
    private static var deviceName: String {
        
        switch modelName {
            
        // Device: Simulator
        case "i386":
            return "32-bit Simulator"
        case "x86_64":
            return "64-bit Simulator"
            
        // Device: iPhone
        case "iPhone1,1":
            return "iPhone"
        case "iPhone1,2":
            return "iPhone 3G"
        case "iPhone2,1":
            return "iPhone 3Gs"
        case "iPhone3,1", "iPhone3,3":
            return "iPhone 4"
        case "iPhone4,1":
            return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":
            return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":
            return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":
            return "iPhone 5s"
        case "iPhone7,1":
            return "iPhone 6 Plus"
        case "iPhone7,2":
            return "iPhone 6"
        case "iPhone8,1":
            return "iPhone 6s"
        case "iPhone8,2":
            return "iPhone 6s Plus"
        case "iPhone8,4":
            return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":
            return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":
            return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":
            return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":
            return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":
            return "iPhone X"
            
        // Device: iPad
        case "iPad1,1":
            return "iPad 1"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":
            return "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":
            return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":
            return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":
            return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":
            return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":
            return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":
            return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":
            return "iPad Air 2"
        case "iPad6,3", "iPad6,4":
            return "iPad Pro 9.7\""
        case "iPad6,7", "iPad6,8":
            return "iPad Pro 12.9\""
        case "iPad6,11", "iPad6,12":
            return "iPad (5th generation)"
        case "iPad7,1", "iPad7,2":
            return "iPad Pro 12.9\" (2nd generation)"
        case "iPad7,3", "iPad7,4":
            return "iPad Pro 10.5\""
            
        // Device: iPod
        case "iPod1,1":
            return "iPod Touch"
        case "iPod2,1":
            return "iPod Touch (2nd generation)"
        case "iPod3,1":
            return "iPod Touch (3rd generation)"
        case "iPod4,1":
            return "iPod Touch (4th generation)"
        case "iPod7,1":
            return "iPod Touch (6th generation)"
            
        // Unknown or new devices we haven't accounted for yet
        default:
            return "unknown"
        }
    }
}
