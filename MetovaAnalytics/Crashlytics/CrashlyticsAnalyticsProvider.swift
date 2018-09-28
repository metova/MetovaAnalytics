//
// CrashlyticsAnalyticsProvider.swift
//
// Created by Nick Griffith on 9/19/18
//

import Crashlytics
import Fabric

/// The AnalyticsProvider for Crashlytics.
public class CrashlyticsAnalyticsProvider: AnalyticsProvider {
    
    private struct Keys {
        
        static let configuration = "Environment"
    }
    
    private var reportableValues: [String: String] = [:] {
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
    /// - Parameter reportableValues: <#reportableValues description#>
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
