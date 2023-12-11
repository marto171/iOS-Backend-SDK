// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS-Backend-SDK",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "iOS-Backend-SDK",
            targets: ["iOS-Backend-SDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ikok07/JSONCoder.git", branch: "main"),
        .package(url: "https://github.com/ikok07/NetworkRequests.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "iOS-Backend-SDK",
            dependencies: [
                .product(name: "JSONCoder", package: "JSONCoder"),
                .product(name: "NetworkRequests", package: "NetworkRequests")
            ]
        ),
        .testTarget(
            name: "UpdateNamePhoto",
            dependencies: ["iOS-Backend-SDK"]),
    ]
)
