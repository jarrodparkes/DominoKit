//
//  Suit.swift
//  DominoKit
//
//  Created by Jarrod Parkes on 1/31/17.
//  Copyright © 2017 Jarrod Parkes. All rights reserved.
//

// MARK: - Suit

/**
    The value of one end of a domino which corresponds to the number of dots,
    also known as pips, seen on its face.

    - invalid: An erroneous, impossible value.
    - zero: The absense of a value, or blank.
    - [remaining values]: The number of dots present on this end of the domino.
*/
public enum Suit: Int {
    case invalid = -1
    case zero = 0
    case one, two, three, four, five, six, seven, eight, nine
    case ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen

    // MARK: Properties

    /// An array containing all possible, valid suits.
    public static let allValues: [Suit] = Suit.suitsFromZeroTo(.eighteen)

    // MARK: Custom Initializer

    /**
        Initializes a suit from an integer value.

        - Parameter value: An integer representing the number of dots present
          for a particular suit

        - Returns: If the value given is valid, then a suit is returned where
          its number of dots is equal to the value.
    */
    public init?(value: Int) {
        switch value {
        case 0...18:
            self = Suit(rawValue: value)!
        default:
            self = .invalid
        }
    }

    // MARK: Helpers

    /**
        Generates an array of suits ranging from zero to a specified suit.

        - Parameter highestSuit: The upper bound for the range of suits to be
          generated

        - Returns: An array of suits ranging from zero to a specified suit.
    */
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

/**
    Compares two suits to determine if the first suit is less than the second
    suit.

    - Parameters:
        lhs: The first suit
        rhs: The second suit

    - Returns: A Boolean value indicating if the first suit is less than the
      second suit.
*/
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
    /// Textual representation of a domino.
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
