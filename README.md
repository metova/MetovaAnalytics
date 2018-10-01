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
    - [CocoaPods](#cocoapods)
    - [Swift Package Manager](#swift-package-manager)
- [Usage](#usage)
- [Documentation](#documentation)
- [Credits](#credits)
- [License](#license)

-----

# Requirements

- Swift 4.2
- iOS 9+

-----

# Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/alamofire). (Tag 'metova-pods')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/metova-pods).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

-----

# Installation

## CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate MetovaAnalytics into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
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

## Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding MetovaAnalytics as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/metova/MetovaAnalytics.git", from: "4.0.0")
]
```

-----

# Usage

``` swift
for provider in [FirebaseAnalyticsProvider(), CrashlyticsAnalyticsProvider()] {
   Analytics.register(provider: provider)
}
```

-----

# Documentation

Documentation can be found [here](http://metova.github.io/MetovaAnalytics/).

-----

# Credits

MetovaAnalytics is owned and maintained by [Metova Inc.](https://metova.com)

[Contributors](https://github.com/Metova/MetovaAnalytics/graphs/contributors)

If you would like to contribute to MetovaAnalytics, see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.



-----

# License

MetovaAnalytics is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
