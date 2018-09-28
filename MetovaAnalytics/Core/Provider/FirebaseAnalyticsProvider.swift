//
// FirebaseAnalyticsProvider.swift
//
// Created by Nick Griffith on 7/19/18
//

import MetovaAnalytics
import Firebase

class FirebaseAnalyticsProvider: AnalyticsProvider {
    
    init() {
        FirebaseApp.configure()
    }
    
    init(options: FirebaseOptions) {
        FirebaseApp.configure(options: options)
    }
    
    init(name: String, options: FirebaseOptions) {
        FirebaseApp.configure(name: name, options: options)
    }
    
    func send(event: AnalyticsEvent) {
        Firebase.Analytics.logEvent(event.name, parameters: event.metadata)
    }
    
}
