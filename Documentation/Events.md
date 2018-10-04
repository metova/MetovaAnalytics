#  Events

Metova Analytics comes with a base `AnalyticsEvent` class, and while you can construct instances of this class, attempting to use this class without subclassing and overriding its `name` property will result in your application crashing.  Most importantly, the base class provides a default implementation for its `metadata` property.  This property comes pre-populated with a lot of information you may want to know about your user, their device, and some of their OS-level settings.  This can be convenient if you are using an analytics system that does not gather all of this information for you.  However it can be noisey in the case that your system does collect all of this information for you.  For more information, see [Metadata](./Metadata.md).

### Basic Events

If you wanted to track user logins, you might create an `AnalyticsEvent` subclass that looks something like this:

```swift
class LogInEvent: AnalyticsEvent {

    let userName: String

    init(userName: String) {
        self.userName = userName
        super.init()
    }

    override name: String { 
        return "login"
    }

    override metadata: [String: Any] {
        return super.metadata.merging(["username":username]) { (_, new) in new }
    }

}
```

Recommended reading: [`merging(_:uniquingKeysWith:)`](https://developer.apple.com/documentation/swift/dictionary/2892849-merging)

This implementation would keep the information Metova Analytics collects for you about the user's device, OS, etc.  If you don't want that information, you can instead change your `metadata` implementation to something like this:

```swift
override metadata: [String: Any] {
    return ["username":username]
}
```

Using this event is then as simple as the above example:

```swift
// On successful login:
Analytics.send(event: LogInEvent(username: username))
```

### Using Inheritance

The real power of these events comes from subclassing.  Consider the example provided in [the article](http://khanlou.com/2017/12/misusing-subclassing/) which provided inspiration for this library:

```swift
class NetworkErrorEvent: NetworkEvent {

    let error: Error

    init(error: Error) {
        self.error = error
        super.init()
    }

    override var name: String {
        return "NetworkErrorEvent"
    }

    override var metadata: [String : Any] {
        return super.metadata.merging(["error": error.localizedDescription]) { (_,new) in new }
    }

}

class NoInternetNetworkErrorEvent: NetworkErrorEvent {

    override var name: String {
        return "NoInternetNetworkErrorEvent"
    }

    override var metadata: [String : Any] {
        return super.metadata.merging(["Message": "No Internet"]) { (_,new) in new }
    }

}
```

This allows us to record errors where the user has no internet differently from errors where the server gave us an error response code.  However, it reduces the code duplication we may otherwise have implemented in order to capture several of the same datapoints we want to have (in this example, for instance, the base `NetworkEvent` class is potentially capturing a lot of basic information we want to know about all network requests).
