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

import Foundation

extension AnalyticsEvent.MetadataKey {
    /// Keys available for the default metadata provided by the base AnalyticsEvent class relating to the application
    public struct ApplicationInfo {
        private init() {}
        
        private static let prefix = "\(AnalyticsEvent.MetadataKey.prefix).ai"
        
        /// The bundle id of the application, equivalent to the Info.plist value for key `CFBundleIdentifier`
        public static let bundleId = "\(prefix).bundleId"
        /// The executable name of the application, equivalent to the Info.plist value for key `CFBundleExecutable`
        public static let executableName = "\(prefix).exeName"
        /// The display name of the application, equivalent to the Info.plist value for the key `CFBundleName`
        public static let displayName = "\(prefix).displayName"
        /// The public version number of the application, equivalent to the Info.plist value for the key `CFBundleShortVersionString`
        public static let appVersion = "\(prefix).appVersion"
        /// The internal build number of the application, equivalent to the Info.plist value for the key `CFBundleVersion`
        public static let buildNumber = "\(prefix).buildNumber"
        /// The minimum supported version of iOS for the application, equivalent to the Info.plist value for the key `MinimumOSVersion`
        public static let minimumOSVersion = "\(prefix).minOS"
    }
}

extension Bundle {

    internal var analyticsAppInfo: [String: String] {
        
        var appInfo = [String: String]()
        
        guard let info = Bundle.main.infoDictionary else {
            return appInfo
        }
        
        if let bundleId = info["CFBundleIdentifier"] as? String {
            appInfo[AnalyticsEvent.MetadataKey.ApplicationInfo.bundleId] = bundleId
        }
        
        if let executableName = info["CFBundleExecutable"] as? String {
            appInfo[AnalyticsEvent.MetadataKey.ApplicationInfo.executableName] = executableName
        }
        
        if let displayName = info["CFBundleName"] as? String {
            appInfo[AnalyticsEvent.MetadataKey.ApplicationInfo.displayName] = displayName
        }
        
        if let appVersion = info["CFBundleShortVersionString"] as? String {
            appInfo[AnalyticsEvent.MetadataKey.ApplicationInfo.appVersion] = appVersion
        }
        
        if let buildNumber = info["CFBundleVersion"] as? String {
            appInfo[AnalyticsEvent.MetadataKey.ApplicationInfo.buildNumber] = buildNumber
        }
        
        if let minimumOSVersion = info["MinimumOSVersion"] as? String {
            appInfo[AnalyticsEvent.MetadataKey.ApplicationInfo.minimumOSVersion] = minimumOSVersion
        }
        
        return appInfo
    }
}
