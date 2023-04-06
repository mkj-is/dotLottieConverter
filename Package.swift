// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "dotLottieConverter",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "dotLottieConverter",
            targets: ["dotLottieConverter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/dotlottie/dotLottieLoader-ios.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "dotLottieConverter",
            dependencies: [
                .product(name: "dotLottieLoader", package: "dotLottieLoader-ios")
            ]),
        .testTarget(
            name: "dotLottieConverterTests",
            dependencies: ["dotLottieConverter"]),
    ]
)
