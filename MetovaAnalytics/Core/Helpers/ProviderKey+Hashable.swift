//
//  ProviderKey+Hashable.swift
//  MetovaAnalytics
//
//  Created by Chris Martin on 7/26/18.
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

// MARK: - Hashable

#if !swift(>=4.1)
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
#endif
