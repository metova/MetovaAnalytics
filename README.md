[![Metova Analytics](./Assets/banner.png?raw=true)](https://cocoapods.org/pods/MetovaAnalytics)

 <a href="https://travis-ci.org/metova/MetovaAnalytics" target="_blank"><img src="https://travis-ci.org/metova/MetovaAnalytics.svg?branch=master" alt="Build Status"></a>
 <a href="https://cocoapods.org/pods/MetovaAnalytics" target="_blank"><img src="https://img.shields.io/cocoapods/v/MetovaAnalytics.svg" alt="CocoaPods Compatible"/></a>
 <a href="https://coveralls.io/github/metova/MetovaAnalytics?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/metova/MetovaAnalytics/badge.svg?branch=master&dummy=no_cache_please_1" alt="Coverage Status"/></a>
 <a href="http://cocoadocs.org/docsets/MetovaAnalytics" target="_blank"><img src="https://img.shields.io/cocoapods/p/MetovaAnalytics.svg?style=flat" alt="Platform"/></a>
 <a href="http://twitter.com/metova" target="_blank"><img src="https://img.shields.io/badge/twitter-@Metova-3CAC84.svg" alt="Twitter"/></a>

Metova Analytics is a universal analytics framework for handling analytics events with any number of analytics providers.

- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#Usage)
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

To integrate Metova Analytics into your Xcode project using CocoaPods, specify it in your `Podfile`:

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

If you would like to test a beta version of Metova Analytics, you can install the latest from develop:

```ruby
pod 'MetovaAnalytics', :git => 'https://github.com/metova/MetovaAnalytics.git', :branch => 'develop'
```

# Usage

Metova Analytics makes reporting events to all of your analytics systems a simple one liner:

```swift
Analytics.send(event: someEvent)
```

Metova Analytics is comprised of three core parts: events, providers, and the main analytics dispatcher.  

 - [Providers](./Documentation/Providers.md) receive events from the dispatcher and report them to a specific analytics system.  They may filter which events they report and transform the data in a particular way.
 - [Events](./Documentation/Events.md) capture any analytic information you need to capture at the time of the event and carry that information forward, through the analytics dispatcher to the registered providers, so that they may appropriately report them into your analytics systems.
 - [The analytics dispatcher](./Documentation/Analytics.md) simply handles making sure all events get to all registered providers.

For further information, please see [the documentation](./Documentation).

# Credits

Metova Analytics is owned and maintained by [Metova Inc.](https://metova.com)

[Contributors](https://github.com/Metova/MetovaAnalytics/graphs/contributors)

If you would like to contribute to Metova Analytics, see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

This library was inspired by [Soroush Khanlou's nice article](http://khanlou.com/2017/12/misusing-subclassing/) about building an inheritance-based analytics system in Swift.  He included many fine suggestions, and we believe he is right.

The Metova Analytics banner image was created by Lorenzo Garnett.

# License

Metova Analytics is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
