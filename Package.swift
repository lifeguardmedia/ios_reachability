// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConnectionIndicator",
    defaultLocalization: "de",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "ConnectionIndicator",
            targets: ["ConnectionIndicator"])
    ],
    targets: [
        .target(name: "ConnectionIndicator")
    ]
)
