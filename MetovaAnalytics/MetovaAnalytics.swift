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

public struct Analytics {
    
    // MARK: Initializers
    
    private init() {}
    
    // MARK: Private Properties
    
    private static var providers: [ProviderKey: AnalyticsProvider] = [:]
    
    // MARK: Actions
    
    public static func send(event: AnalyticsEvent) {
        
        for provider in providers.values {
            
            provider.send(event: event)
        }
    }
}

// MARK: - Providers
extension Analytics {
    
    enum ProviderKey {
        
        case explicit(String)
        case inferred(String)
    }
    
    // MARK: Actions
    
    public static func register(provider: AnalyticsProvider, for key: String) {
        
        providers[.explicit(key)] = provider
    }
    
    public static func removeProvider(for key: String) {
        
        providers[.explicit(key)] = nil
    }
    
    public static func register(provider: AnalyticsProvider) {
        
        let key = String(describing: type(of: provider))
        providers[.inferred(key)] = provider
    }
    
    public static func remove<Provider: AnalyticsProvider>(for type: Provider.Type) {
        
        let key = String(describing: type)
        providers[.inferred(key)] = nil
    }
}
