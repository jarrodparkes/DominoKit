![DominoKit](https://raw.githubusercontent.com/jarrodparkes/DominoKit/assets/domino-kit.png "Domino Kit")

<img src="https://img.shields.io/badge/os-mac | linux-blue.svg?style=flat" alt="Mac and Linux" />
<a href="https://raw.githubusercontent.com/jarrodparkes/DominoKit/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-orange.svg?style=flat" alt="Swift 3 Compatible" /></a>

## Summary

DominoKit is a Swift library for creating applications with dominoes.

## Installation

Using the Swift Package Manager, ensure the DominoKit is included in the dependencies section of `Package.swift`:

```swift
let package = Package(
    name: "MyProject",
    dependencies: [
        .Package(url: "https://github.com/jarrodparkes/DominoKit.git", majorVersion: 1),
        ...
    ]
    ...
)
```

## Usage

```swift
import DominoKit

let sixEight = Domino(suitOne: .six, suitTwo: .eight)
print(sixEight) // "[06|08]"
print(sixEight.suitOne) // "06"
print(sixEight.suitTwo) // "08"
print(sixEight.isDouble) // false
print(sixEight.isSingle) // true
print(sixEight.rank) // 14

let doubleSix = Domino(doubleSuit: .six)
print(sixEight.hasMatchingSuit(withDomino: doubleSix)) // true
```
