// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MetovaAnalytics",
    targets: [
        .target(
            name: "MetovaAnalytics",
            path: "MetovaAnalytics"
        ),
        .testTarget(
            name: "MetovaAnalyticsTests",
            dependencies: ["MetovaAnalytics"],
            path: "MetovaAnalyticsTests"
        ),
    ]
)
