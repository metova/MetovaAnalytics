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

/// Namespace to drive the MetovaAnalytics framework
public struct Analytics {
    
    // MARK: Initializers
    
    private init() {}
    
    // MARK: Private Properties
    
    fileprivate static var providers: [ProviderKey: AnalyticsProvider] = [:]
    
    // MARK: Actions
    
    /// Sends an analytics event to all the registered providers
    ///
    /// - Parameter event: The event to send
    public static func send(event: AnalyticsEvent) {
        
        for provider in providers.values {
            
            provider.send(event: event)
        }
    }
}

// MARK: - Providers
extension Analytics {
    
    internal enum ProviderKey: Hashable {
        
        case explicit(String)
        case inferred(String)
    }
    
    // MARK: Actions
    
    /// Registers a provider under a given explit key.  This key can be used later to unregister the provider.
    ///
    /// - Parameters:
    ///   - provider: The provider to register
    ///   - key: The key to use to register the provider
    public static func register(provider: AnalyticsProvider, for key: String) {
        
        providers[.explicit(key)] = provider
    }
    
    /// Removes a provider registered under an explicit key.
    ///
    /// - Parameter key: The key of the provider to unregister
    public static func removeProvider(for key: String) {
        
        providers[.explicit(key)] = nil
    }
    
    /// Registers a provider.  Only one provider per class can be registered via this method.  Registering a provider of the same type will overwrite a previously registered provider.  In order to register more than one provider per key, register them under explicit keys.
    ///
    /// - Parameter provider: The provider to register
    public static func register(provider: AnalyticsProvider) {
        
        let key = String(describing: type(of: provider))
        providers[.inferred(key)] = provider
    }
    
    /// Removes a provider registered without an explicit key
    ///
    /// - Parameter type: The type of provider to remove
    public static func remove<Provider: AnalyticsProvider>(for type: Provider.Type) {
        
        let key = String(describing: type)
        providers[.inferred(key)] = nil
    }
}
