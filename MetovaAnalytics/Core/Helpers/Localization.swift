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
    /// Keys available for the default metadata provided by the base AnalyticsEvent class relating to the user's localization preferences
    public struct PreferredLocalization {
        private init() {}
        
        private static let prefix = "\(AnalyticsEvent.MetadataKey.prefix)_pl"
        
        /// The country code of the user's preferred localization
        public static let countryCode = "\(prefix)_countryCode"
        /// The language code of the user's preferred localization
        public static let languageCode = "\(prefix)_languageCode"
        /// The canonical language id of the user's preferred localization
        public static let canonicalLanguageId = "\(prefix)_canonicalLangId"
        /// The display name of the user's preferred localization
        public static let languageDisplayName = "\(prefix)_langDisplayName"
    }
}

extension NSLocale {
    
    internal static var analyticsInfo: [String: String] {
        
        var localizationDictionary = [String: String]()
        
        guard let localeIdentifier = NSLocale.preferredLanguages.first else {
            return localizationDictionary
        }
        
        let components = NSLocale.components(fromLocaleIdentifier: localeIdentifier)
        
        if let countryCode = components[NSLocale.Key.countryCode.rawValue] {
            localizationDictionary[AnalyticsEvent.MetadataKey.PreferredLocalization.countryCode] = countryCode
        }
        
        if let languageCode = components[NSLocale.Key.languageCode.rawValue] {
            localizationDictionary[AnalyticsEvent.MetadataKey.PreferredLocalization.languageCode] = languageCode
            localizationDictionary[AnalyticsEvent.MetadataKey.PreferredLocalization.canonicalLanguageId] = NSLocale.canonicalLanguageIdentifier(from: languageCode)
            localizationDictionary[AnalyticsEvent.MetadataKey.PreferredLocalization.languageDisplayName] = NSLocale(localeIdentifier: localeIdentifier).displayName(forKey: .identifier, value: languageCode)
        }
        
        return localizationDictionary
        
    }
    
}
