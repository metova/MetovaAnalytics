//
// ScreenViewEvent.swift
//
// Created by Nick Griffith on 7/19/18
//

class ScreenViewEvent: AnalyticsEvent {
    
    private var screenName: String
    
    init<VC: UIViewController>(for viewController: VC) {
        screenName = type(of: viewController).description()
        super.init()
    }
    
    override var name: String {
        return "Screen View"
    }
    
    override var metadata: [String: String] {
        return super.metadata.merging(["screen": screenName]) { (_, new) in new }
    }
    
}
