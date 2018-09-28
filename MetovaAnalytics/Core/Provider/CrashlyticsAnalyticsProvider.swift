//
// CrashlyticsAnalyticsProvider.swift
//
// Created by Nick Griffith on 9/19/18
//

import Crashlytics
import Fabric

class CrashlyticsAnalyticsProvider: AnalyticsProvider {
    
    private struct Keys {
        
        static let configuration = "Environment"
    }
    
    var reportableValues: [String: String] = [:] {
        didSet {
            for key in oldValue.keys {
                Crashlytics.sharedInstance().setObjectValue(nil, forKey: key)
            }
            
            for (key, value) in reportableValues {
                Crashlytics.sharedInstance().setObjectValue(value, forKey: key)
            }
        }
    }
    
    init(reportableValues: [String: String] = [:]) {
        Fabric.with([Crashlytics.self])

        self.reportableValues = reportableValues
    }
    
    func send(event: AnalyticsEvent) {
        guard let event = event as? NonFatalErrorEvent else { return }
        
        for (key, value) in event.metadata {
            Crashlytics.sharedInstance().setObjectValue(value, forKey: "meta[\(key)]")
        }
        Crashlytics.sharedInstance().recordError(event.error)
    }
    
}
