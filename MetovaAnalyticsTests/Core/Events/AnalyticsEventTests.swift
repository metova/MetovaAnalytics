//
// AnalyticsEventTests.swift
//
// Created by Nick Griffith on 9/28/18
//

import XCTest
@testable import MetovaAnalytics

class AnalyticsEventTests: XCTestCase {

    private class MockEvent: AnalyticsEvent {
        override var name: String { return "MockEvent" }
    }
    
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
