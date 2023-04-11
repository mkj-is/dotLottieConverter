// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "dotLottieConverter",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "dotLottieConverter",
            targets: ["dotLottieConverter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/dotlottie/dotLottieLoader-ios.git", from: "0.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "dotLottieConverter",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "dotLottieLoader", package: "dotLottieLoader-ios")
            ]),
        .testTarget(
            name: "dotLottieConverterTests",
            dependencies: ["dotLottieConverter"]),
    ]
)
