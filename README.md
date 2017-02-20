![DominoKit](https://raw.githubusercontent.com/jarrodparkes/DominoKit/assets/domino-kit.png "Domino Kit")

[![Build Status](https://travis-ci.org/jarrodparkes/DominoKit.svg?branch=master&style=flat)](https://travis-ci.org/jarrodparkes/DominoKit)
[![Version](https://img.shields.io/cocoapods/v/DominoKit.svg?style=flat)](https://cocoapods.org/pods/DominoKit)
[![License](https://img.shields.io/cocoapods/l/DominoKit.svg?style=flat)](https://opensource.org/licenses/MIT)

## Summary

DominoKit is a Swift library for creating applications with dominoes.

## Installation

### Cocoapods

Create a `Podfile` and add DominoKit.

```ruby
target 'YourApp' do
    pod 'DominoKit'
end
```

### Swift Package Manager

Using the Swift Package Manager, ensure DominoKit is included in the dependencies section of `Package.swift`:

```swift
let package = Package(
    name: "MyProject",
    dependencies: [
        .Package(url: "https://github.com/jarrodparkes/DominoKit.git", majorVersion: 1),
    ]
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
print(sixEight.hasMatchingSuit(.six)) // true

let oneFive: Domino = "[01|05]"
print(oneFive.rank) // 6

let doubleNineSet = DominoSet.standardSet(.nine)
doubleNineSet.shuffle()
if let randomDomino = doubleNineSet.deal() {
    print(randomDomino) // domino between "[00|00]" and "[09|09]"
}
```

## License

DominoKit is available under the MIT license. See the LICENSE file for more info.
