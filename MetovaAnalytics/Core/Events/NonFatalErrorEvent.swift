//
// NonFatalErrorEvent.swift
//
// Created by Nick Griffith on 9/19/18
//

import MetovaAnalytics

class NonFatalErrorEvent: AnalyticsEvent {
    
    let error: Error
    
    init(error: Error) {
        self.error = error
        super.init()
    }
    
    override var name: String {
        return "Non-Fatal Error"
    }
    
    override var metadata: [String: String] {
        return super.metadata.merging(["error": error.localizedDescription]) { (_, new) in new }
    }
    
}
