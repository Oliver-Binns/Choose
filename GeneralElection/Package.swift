// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "GeneralElection",
    platforms: [.iOS(.v17), .macCatalyst(.v17), .macOS(.v14), .visionOS(.v1)],
    products: [
        .library(name: "Parties", targets: ["Parties"]),
        .library(name: "Policies", targets: ["Policies"]),
        .library(name: "Constituencies", targets: ["Constituencies"]),
        
        .library(name: "Choose", targets: ["Choose"])
    ],
    targets: [
        .target(name: "Parties", 
                resources: [.process("Resources")]),
        .testTarget(name: "PartiesTests", 
                    dependencies: ["Parties"]),
        
        .target(name: "Constituencies", 
                dependencies: ["Parties"],
                resources: [.process("Resources")]),
        
        .testTarget(name: "ConstituenciesTests",
                    dependencies: ["Constituencies", "Extensions"],
                    resources: [.process("Resources")]),
        
        .target(name: "Policies",
                dependencies: ["Parties"],
                resources: [.process("Resources")]),
        
        .testTarget(name: "PoliciesTests",
                    dependencies: ["Policies", "Extensions"],
                    resources: [.process("Resources")]),
        
        .target(name: "Choose", dependencies: ["Policies"]),
        
        .target(name: "Extensions")
    ]
)
