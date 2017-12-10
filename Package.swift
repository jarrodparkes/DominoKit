// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "DominoKit",
    products: [
        .library(name: "DominoKit", targets: ["DominoKit"])
    ],
    targets: [
        .target(
            name: "DominoKit",
            dependencies: [],
            path: "Sources/",
            exclude: ["Pod+Random.swift"]
        ),
        .testTarget(
            name: "DominoKitTest",
            dependencies: ["DominoKit"],
            path: "Tests/"
        ),
    ]
)
