//
//  NonFatalErrorEvent.swift
//
//  Created by Nick Griffith on 9/19/18
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
