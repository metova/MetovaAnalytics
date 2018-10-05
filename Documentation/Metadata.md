#  Metadata

In general, the metadata exists to provide additional context about the event that is being reported.  Depending on the depth of information you are looking for, you may or may not choose to provide additional metadata on your events.  

The [`AnalyticsEvent`](../MetovaAnalytics/Core/Events/AnalyticsEvent.swift) provides several universal default key-value pairs in its [`metadata` implementation](../MetovaAnalytics/Core/Event/AnalyticsEvent.swift#L52-59).  If you'd like to keep these items while still adding your own, we recommend using Swift's [`merging(_:uniquingKeysWith:)`](https://developer.apple.com/documentation/swift/dictionary/2892849-merging) on `super.metadata` in your subclass.  However, if you don't want these keys cluttering your events, simply override `metadata` to return your own dictionary, ignoring the `super` implementation.

## Default Keys

### Application Information

These keys contain information about your application's metadata.

* `AnalyticsEvent.MetadataKey.ApplicationInfo.bundleId`: The bundle id of the application, equivalent to the Info.plist value for key `CFBundleIdentifier`.
* `AnalyticsEvent.MetadataKey.ApplicationInfo.executableName`: The executable name of the application, equivalent to the Info.plist value for key `CFBundleExecutable`.
* `AnalyticsEvent.MetadataKey.ApplicationInfo.displayName`: The display name of the application, equivalent to the Info.plist value for key `CFBundleName`.
* `AnalyticsEvent.MetadataKey.ApplicationInfo.appVersion`: The public version number of the application, equivalent to the Info.plist value for the key `CFBundleShortVersionString`.
* `AnalyticsEvent.MetadataKey.ApplicationInfo.buildNumber`: The internal build number of the application, equivalent to the Info.plist value for key `CFBundleVersion`.
* `AnalyticsEvent.MetadataKey.ApplicationInfo.minimumOSVersion`: The minimum supported version of iOS for the application, equivalent to the Info.plist value for key `MinimumOSVersion`.

### Device Info

These keys contain information about the user's device.

* `AnalyticsEvent.MetadataKey.DeviceInfo.deviceModel`: The idiomatic Apple model name for the device.
* `AnalyticsEvent.MetadataKey.DeviceInfo.deviceName`: The common name of the device.
* `AnalyticsEvent.MetadataKey.DeviceInfo.osName`: The name of the operating system installed on the device.
* `AnalyticsEvent.MetadataKey.DeviceInfo.osVersion`: The version of the operating system installed on the device.

### Device State

These keys contain information about the current state of the user's device.

* `AnalyticsEvent.MetadataKey.DeviceState.orientation`: The orientation the device is rotated to at the time the event is created.  Possible values are:
    * `"portrait"`
    * `"landscape"`
    * `"face up"`
    * `"face down"`
    * `"unknown"`
* `AnalyticsEvent.MetadataKey.DeviceState.batteryState`: The state of the battery at the time the event is created.  Possible values are:
    * `"on battery, discharging"`
    * `"plugged in, less than 100%"`
    * `"plugged in, at 100%"`
    * `"unknown"`
* `AnalyticsEvent.MetadataKey.DeviceState.batteryLevel`: Charge level of the battery at the time the event is created, represented as a floating-point value between 0 (fully depleted) and 1 (fully charged). 

### Preferred Localization

These keys contain information about the user's localization preferences.  Your app may or may not have translations available for the user's preferences.  These values therefore do not represent any information about what language is actually being presented to the user within your application.

* `AnalyticsEvent.MetadataKey.PreferredLocalization.countryCode`: The country code of the user's preferred localization.
* `AnalyticsEvent.MetadataKey.PreferredLocalization.languageCode`: The language code of the user's preferred localization.
* `AnalyticsEvent.MetadataKey.PreferredLocalization.canonicalLanguageId`: The canonical language id of the user's preferred localization.
* `AnalyticsEvent.MetadataKey.PreferredLocalization.languageDisplayName`: The display name of the user's preferred localization.
