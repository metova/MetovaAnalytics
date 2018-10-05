#  Analytics

The [`Analytics` namespace](../MetovaAnalytics/Core/MetovaAnalytics.swift) is where most of the work for Metova Analytics happens.

As a consumer, you will interact with this struct in two ways:

1. Registering & removing analytics providers.
2. Sending events.

## Registering Providers

Once you've created a provider (see [Providers](./Providers.md)), you have two options for registering and removing it.  In practice, we find removing providers is fairly rare outside of automated testing, however the behavior is fully supported.

### Implicit Registration

[`register(provider:)`](../MetovaAnalytics/Core/Provider/MetovaAnalytics.swift#L84-91)

Using this method registers a provider based on its type. This is the recommended method for registering providers, for simplicity sake. Attempting to register an additional provider of the same type will remove any provider of the same type you had implicitly registered.  If you need to register multiple providers of the same type, see [explicit registration](#ExplicitRegistration).

In order to remove a provider registered implicitly based on type, use [`remove<Provider: AnalyticsProvider>(for type: ProviderType)`](../MetovaAnalytics/Core/Provider/MetovaAnalytics.swift#L93-100).

```swift
// Register
Analytics.register(provider: FooProvider())

// Remove
Analytics.remove(for FooProvider.self)
```

### Explicit Registration

[`register(provider:for:)`](../MetovaAnalytics/Core/Provider/MetovaAnalytics.swift#L66-74)

Using this method registers a provider under a specific key.  We general recommend against this registration method, however it can be particularly useful when registering a mock provider to confirm that some action in your app triggers an analytics event to be sent.  This allows you to easily register multiple mock providers for different purposes during your tests.  An example of this can be found in Metova Analytics's own tests, [here](../MetovaAnalyticsTests/Core/AnalyticsTests.swift#L42-47).

In order to remove a provider registered under an explicit key, use [`removeProvider(for:)`](../MetovaAnalytics/Core/Provider/MetovaAnalytics.swift#L76-82).

```swift
// Register
Analytics.register(provider: MockProvider() for: "Mock")

// Remove
Analytics.removeProvider(for: "Mock")
```

## Sending Events

As discussed in the top level documentation, sending an event is as simple as constructing it and passing it in:

```swift
let event = FooEvent(with: parameters)
Analytics.send(event: event)
```

The analytics dispatcher makes sure all registered providers hear about this event and give them an opportunity send this event up to their corresponding analytics APIs.  

