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

/// An abstract base class, from which custom events should inherit.
open class AnalyticsEvent {
    
    /// Keys available for the default metadata provided by the base AnalyticsEvent class
    public struct MetadataKey {
        private init() {}
        
        internal static let prefix = "metova"

        public struct PreferredLocalization {
            private init() {}
            
            private static let prefix = "\(MetadataKey.prefix).pl"
            
            public static let countryCode = "\(prefix).countryCode"
            public static let languageCode = "\(prefix).languageCode"
            public static let canonicalLanguageId = "\(prefix).canonicalLangId"
            public static let languageDisplayName = "\(prefix).langDisplayName"
        }
        
        public struct DeviceInfo {
            private init() {}
            
            private static let prefix = "\(MetadataKey.prefix).di"
            
            public static let osName = "\(prefix).OSName"
            public static let osVersion = "\(prefix).OSVersion"
            public static let deviceModel = "\(prefix).deviceModel"
            public static let deviceName = "\(prefix).deviceName"
        }
    }
    
    // MARK: Open Properties
    
    /// The name of the event.  This property should always be overridden by subclasses.
    open var name: String {
        
        fatalError("AnalyticsEvent is an abstract class. Name must be provided by a subclass.")
    }
    
    /// The event's metadata.  This property can be optionally overridden.  It is highly recommended that the subclass merge it's new key-value pairs with its parent class's metadata.
    /// `return super.metadata.merging(newKeyValues) { (_, new) in new }`
    open var metadata: [String: Any] {
        
        return [:]
            .merging(deviceState) { (_, new) in new }
            .merging(deviceInfo) { (_, new) in new }
            .merging(preferredLocalization) { (_, new) in new }
            .merging(applicationInformation) { (_, new) in new }
    }
    
    // MARK: Initializers
    
    /// Constructs the Event.
    public init() {}
    
    // MARK: Private Properties

    private var deviceState: [String: String] { return UIDevice.current.analyticsInfo }
    
    private lazy var applicationInformation: [String: String] = Bundle.main.analyticsAppInfo
    
    private lazy var preferredLocalization: [String: String] = NSLocale.analyticsInfo

    private lazy var deviceInfo: [String: String] = UIDevice.analyticsInfo
}
