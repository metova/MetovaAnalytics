//
// NonFatalErrorEvent.swift
//
// Created by Nick Griffith on 9/19/18
//


/// Non-fatal Error events can be used to track errors using your analytics provider
public class NonFatalErrorEvent: AnalyticsEvent {
    
    /// The error object to be reported to analytics.
    let error: Error
    
    /// Intializer for NonFatalErrorEvent
    ///
    /// - Parameter error: The error object to report to analytics.
    public init(error: Error) {
        self.error = error
        super.init()
    }
    
    
    /// The name of the non-fatal error event.
    public override var name: String {
        return "Non-Fatal Error"
    }
    
    
    /// The metadata to include with this event when reporting to Analytics.
    public override var metadata: [String: Any] {
        return super.metadata.merging(["error": error.localizedDescription]) { (_, new) in new }
    }
    
}
