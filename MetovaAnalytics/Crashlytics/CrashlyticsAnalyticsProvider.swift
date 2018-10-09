//
//  CrashlyticsAnalyticsProvider.swift
//
//  Created by Nick Griffith on 9/19/18
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

import Crashlytics
import Fabric

/// The AnalyticsProvider for Crashlytics.
public class CrashlyticsAnalyticsProvider: AnalyticsProvider {
    
    public var reportableValues: [String: String] = [:] {
        didSet {
            for key in oldValue.keys {
                Crashlytics.sharedInstance().setObjectValue(nil, forKey: key)
            }
            
            for (key, value) in reportableValues {
                Crashlytics.sharedInstance().setObjectValue(value, forKey: key)
            }
        }
    }
    
    /// Initialize the CrashlyticsAnalyticsProvider with a dictionary of key-value pairs to include in AnalyticsEvents sent to Crashlytics.
    ///
    /// - Parameter reportableValues: Dictionary of key-value pairs to include in AnalyiticsEvents.
    public init(reportableValues: [String: String] = [:]) {
        Fabric.with([Crashlytics.self])

        self.reportableValues = reportableValues
    }
    
    /// Send an Analytics event to Crashlytics.
    ///
    /// - Parameter event: The AnalyticsEvent to send to Crashlytics.
    public func send(event: AnalyticsEvent) {
        guard let event = event as? NonFatalErrorEvent else { return }
        
        for (key, value) in event.metadata {
            Crashlytics.sharedInstance().setObjectValue(value, forKey: "meta[\(key)]")
        }
        Crashlytics.sharedInstance().recordError(event.error)
    }
    
}
