//
// AnalyticsEventTests.swift
//
// Created by Nick Griffith on 9/28/18
// Copyright © 2018 Metova. All rights reserved.
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

import XCTest
@testable import MetovaAnalytics

class AnalyticsEventTests: XCTestCase {
    
    func testMetadata() {
        
        let expectedKeys: [String] = [
            "DeviceInfo_Device_Model",
            "DeviceInfo_Device_Name",
            "DeviceInfo_OS_Name",
            "DeviceInfo_OS_Version",
            "DeviceState_BatteryLevel",
            "DeviceState_BatteryState",
            "DeviceState_Orientation",
            "LocalePref_CanonicalLanguageId",
            "LocalePref_LanguageDisplayName",
            "LocalePref_LanguageCode",
        ]
        
        let actualMetadataKeys = MockEvent().metadata.keys
        
        for key in expectedKeys {
            XCTAssertTrue(actualMetadataKeys.contains(key), "Expected metadata to contain [\(key)], but it was not found.")
        }
    }

}
