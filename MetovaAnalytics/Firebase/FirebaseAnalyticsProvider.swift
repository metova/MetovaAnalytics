//
// FirebaseAnalyticsProvider.swift
//
// Created by Nick Griffith on 7/19/18
//

import Firebase

/// An analytics provider for Firebase.
public class FirebaseAnalyticsProvider: AnalyticsProvider {
    
    /// Initialize the FirebaseAnalyticsProvider with default options and no name
    public init() {
        FirebaseApp.configure()
    }
    
    /// Initialize the FirebaseAnalyticsProvider without a name.
    ///
    /// - Parameter options: The Firebase application options used to configure the services.
    public init(options: FirebaseOptions) {
        FirebaseApp.configure(options: options)
    }
    
    /// Initialize the FirebaseAnalyticsProvider with a name.
    ///
    /// - Parameters:
    ///   - name: The application's name given by the developer. The name should should only contain Letters, Numbers and Underscores.
    ///   - options: The Firebase application options used to configure the services.
    public init(name: String, options: FirebaseOptions) {
        FirebaseApp.configure(name: name, options: options)
    }
    
    /// Send an Analytics event to Firebase.
    ///
    /// - Parameter event: The analytics event to send to Firebase.
    public func send(event: AnalyticsEvent) {
        Firebase.Analytics.logEvent(event.name, parameters: event.metadata)
    }
    
}
