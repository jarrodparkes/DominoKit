//
//  Suit.swift
//  DominoKit
//
//  Created by Jarrod Parkes on 1/31/17.
//  Copyright © 2017 Jarrod Parkes. All rights reserved.
//

// MARK: - Suit

public enum Suit: Int {
    case invalid = -1
    case zero = 0
    case one, two, three, four, five, six, seven, eight, nine
    case ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen

    // MARK: Properties

    public static let allValues: [Suit] = Suit.suitsFromZeroTo(.eighteen)

    // MARK: Custom Initializer

    public init?(value: Int) {
        switch value {
        case 0...18:
            self = Suit(rawValue: value)!
        default:
            self = .invalid
        }
    }

    // MARK: Helpers

    public static func suitsFromZeroTo(_ highestSuit: Suit) -> [Suit] {
        guard highestSuit != .invalid else {
            return [Suit]()
        }

        var suits = [Suit]()
        for x in 0...highestSuit.rawValue {
            suits.append(Suit(rawValue: x)!)
        }
        return suits
    }
}

// MARK: - Suit: Comparable

extension Suit: Comparable {}

public func <(lhs: Suit, rhs: Suit) -> Bool {
    switch (lhs, rhs) {
    case (.invalid, _):
        return true
    case (_, .invalid):
        return false
    case (_, _) where lhs == rhs:
        return false
    default:
        return lhs.rawValue < rhs.rawValue
    }
}

// MARK: - Suit: CustomStringConvertible

extension Suit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalid:
            return "invalid"
        case _ where self.rawValue < 10:
            return "0\(self.rawValue)"
        case _ where self.rawValue >= 10 && self.rawValue != Suit.invalid.rawValue:
            return "\(self.rawValue)"
        default:
            return "unknown"
        }
    }
}
