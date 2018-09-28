//
//  FirebaseAnalyticsProvider.swift
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
