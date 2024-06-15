// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataFormatting",
    platforms: [.iOS(.v17), .macCatalyst(.v17), .macOS(.v14), .visionOS(.v1)],
    products: [
        .executable(name: "DataFormatting", targets: ["DataFormatting"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.8.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.2.3")),
        .package(path: "../GeneralElection")
    ],
    targets: [
        .executableTarget(name: "DataFormatting", dependencies: [
            .product(name: "SwiftCSV", package: "SwiftCSV"),
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "Policies", package: "GeneralElection")
        ])
    ]
)
