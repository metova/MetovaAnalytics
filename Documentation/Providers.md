#  Providers

Metova Analytics defines the [`AnalyticsProvider` protocol](../MetovaAnalytics/Core/Provider/AnalyticsProvider.swift).  When using Metova Analytics, you should create one concrete implementation of this protocol for every unique analytics solution you wish to report events to.  You only need to implement the single method, `send(event: AnalyticsEvent)`, which the analytics dispatcher will call, passing an `AnalyticsEvent` that is ready to be reported.

### Basic Provider

Using [Google Analytics for Firebase](https://firebase.google.com/docs/analytics/ios/start) serves for a very simple implementation of the `AnalyticsProvider` protocol:

```swift
import Firebase

class FirebaseAnalyticsProvider: AnalyticsProvider {
    
    init() {
        FirebaseApp.configure()
    }
    
    func send(event: AnalyticsEvent) {
        Firebase.Analytics.logEvent(event.name, parameters: event.metadata)
    }
}
```

With this implementation, every event sent through `Analytics.send(event:)` will be sent up to Firebase.

### Filtering Events

A more sophisticated implementation may only want to report certain types events.  For example, we can use Metova Analytics to report non-fatal errors to Crashlytics (while still making sure our other analytics systems hear about these events).

```swift
import Crashlytics
import Fabric

protocol NonFatalErrorEvent {
    var error: Error { get }
}

class CrashlyticsAnalyticsProvider: AnalyticsProvider {
    
    init() {
        Fabric.with([Crashlytics.self()])
    }
    
    func send(event: AnalyticsEvent) {
        guard event is NonFatalErrorEvent else { return }
    
        for (key, value) in event.metadata {
            Crashlytics.sharedInstance().setObjectValue(value, forKey: "meta[\(key)]")
        }
        Crashlytics.sharedInstance().recordError(event.error)
        
        for key in event.metadata.keys {
            Crashlytics.sharedInstance().setObjectValue(nil, forKey: "meta[\(key)]")
        }
    }
    
}
```

If we've registered both of these example providers with the dispatcher, the sending a `NonFatalErrorEvent` through the system will result in a non-fatal error report generated in Crashlytics and a non-fatal error event showing up in Firebase.  Meanwhile, all events reported that are not `NonFatalErrorEvent`s will still make it to Firebase without being reported to Crashlytics.

Implementing your providers in this way has the additional benefit of decoupling your application from specific analytics systems.  The only reference your app will have to the specific analytics system will exist in the provider you implement, and in the name of the provider itself (if you name it that way), which will typically only be used in one place: where you're registering the provider with the dispatcher.
