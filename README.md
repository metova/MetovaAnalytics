[![MetovaAnalytics](https://github.com/metova/MetovaAnalytics/blob/master/Assets/MetovaAnalytics.png?raw=true)](https://cocoapods.org/pods/MetovaAnalytics)

<p align="center">
 <a href="https://travis-ci.org/metova/MetovaAnalytics" target="_blank"><img src="https://travis-ci.org/metova/MetovaAnalytics.svg?branch=master" alt="Build Status"></a>
 <a href="https://cocoapods.org/pods/MetovaAnalytics" target="_blank"><img src="https://img.shields.io/cocoapods/v/MetovaAnalytics.svg" alt="CocoaPods Compatible"/></a>
 <a href="http://metova.github.io/MetovaAnalytics/" target="_blank"><img src="https://cdn.rawgit.com/metova/MetovaAnalytics/master/docs/badge.svg" alt="Documentation"/></a>
 <a href="https://coveralls.io/github/metova/MetovaAnalytics?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/metova/MetovaAnalytics/badge.svg?branch=master&dummy=no_cache_please_1" alt="Coverage Status"/></a>
 <a href="http://cocoadocs.org/docsets/MetovaAnalytics" target="_blank"><img src="https://img.shields.io/cocoapods/p/MetovaAnalytics.svg?style=flat" alt="Platform"/></a>
 <a href="http://twitter.com/metova" target="_blank"><img src="https://img.shields.io/badge/twitter-@Metova-3CAC84.svg" alt="Twitter"/></a>
 <br/>
</p>

MetovaAnalytics is a universal analytics framework for handling analytics events with any number of analytics providers.

- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Documentation](../Documentation)
- [Credits](#credits)
- [License](#license)

# Requirements

- Swift 4.2
- iOS 9+

# Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/metova-pods). (Tag 'metova-pods')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/metova-pods).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

# Installation

## CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate MetovaAnalytics into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'YourTarget' do
    pod 'MetovaAnalytics'
end
```

Then, run the following command:

```bash
$ pod install
```

If you would like to test a beta version of MetovaAnalytics, you can install the latest from develop:

```ruby
pod 'MetovaAnalytics', :git => 'https://github.com/metova/MetovaAnalytics.git', :branch => 'develop'
```

# Usage

Metova Analytics makes reporting events to all of your analytics systems a simple one liner:

```swift
Analytics.send(event: someEvent)
```

Using this system decouples your application from any specific analytics system.  It also conveniently allows you to start creating and recording the analytics events you know you want to record before actually hooking into any sort of analytics system.  If you've not registered any providers, sending events is effectively a noop.

## Events

Metova Analytics comes with a base `AnalyticsEvent` class, and while you can construct instances of this class, attempting to use this class without subclassing and overriding its `name` property will result in your application crashing.  Most importantly, the base class provides a default implementation for its `metadata` property.  This property comes pre-populated with a lot of information you may want to know about your user, their device, and some of their OS-level settings.  This can be convenient if you are using an analytics system that does not gather all of this information for you.  However it can be noisey in the case that your system does collect all of this information for you.  For more information, see [MetaData Keys](../TODO.md).

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

## Providers

TODO 🙁😞😢😭

# Credits

MetovaAnalytics is owned and maintained by [Metova Inc.](https://metova.com)

[Contributors](https://github.com/Metova/MetovaAnalytics/graphs/contributors)

If you would like to contribute to MetovaAnalytics, see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

# License

MetovaAnalytics is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
