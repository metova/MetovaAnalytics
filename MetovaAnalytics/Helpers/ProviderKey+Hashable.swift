//
//  ProviderKey+Hashable.swift
//  MetovaAnalytics
//
//  Created by Chris Martin on 7/26/18.
//  Copyright © 2018 Metova. All rights reserved.
//

import Foundation

// MARK: - Hashable
@available(swift, obsoleted: 4.1)
extension Analytics.ProviderKey {
    
    public var hashValue: Int {
        
        switch self {
        case .explicit(let string):
            return "explicit(\(string))".hashValue
        case .inferred(let string):
            return "inferred(\(string))".hashValue
        }
    }
    
    public static func == (lhs: Analytics.ProviderKey, rhs: Analytics.ProviderKey) -> Bool {
        
        switch (lhs, rhs) {
        case (.explicit(let lhs), .explicit(let rhs)):
            return lhs == rhs
        case (.inferred(let lhs), .inferred(let rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}
