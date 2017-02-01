import PackageDescription

let package = Package(
    name: "DominoKit",
    dependencies: [
        .Package(url: "https://github.com/apple/example-package-fisheryates.git", majorVersion: 2),
    ]
)
