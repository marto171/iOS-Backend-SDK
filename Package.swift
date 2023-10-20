// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS-Backend-SDK",
    products: [
        .library(
            name: "iOS-Backend-SDK",
            targets: ["iOS-Backend-SDK"]),
    ],
    targets: [
        .target(
            name: "iOS-Backend-SDK"),
        .testTarget(
            name: "iOS-Backend-SDKTests",
            dependencies: ["iOS-Backend-SDK"]),
    ]
)
