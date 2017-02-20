//
//  Domino.swift
//  DominoKit
//
//  Created by Jarrod Parkes on 1/31/17.
//  Copyright © 2017 Jarrod Parkes. All rights reserved.
//

// MARK: - Domino

/// 🁃 A rectangular tile with a line dividing its face into two suited ends.
public struct Domino {

    // MARK: Properties

    /// The first suited end of the domino (left-to-right).
    public let suitOne: Suit

    /// The second suited end of the domino (left-to-right).
    public let suitTwo: Suit

    // MARK: Computed Properties

    /// The sum of the two suited ends, also called weight.
    public var rank: Int {
        return suitOne.rawValue + suitTwo.rawValue
    }

    /// A Boolean value indicating if the suited ends are equal.
    public var isDouble: Bool {
        return suitOne.rawValue == suitTwo.rawValue
    }

    /// A Boolean value indicating if the suited ends are not equal.
    public var isSingle: Bool {
        return !isDouble
    }

    /// An array containing the suited value of each end.
    public var suits: [Suit] {
        return [suitOne, suitTwo]
    }

    // MARK: Initializers

    /**
        Initializes a new domino by specifying a suit for each end.

        - Parameters:
            - suitOne: The first suited end of the domino (left-to-right)
            - suitTwo: The second suited end of the domino (left-to-right)

        - Returns: A domino with the specified suits.
    */
    public init(suitOne: Suit, suitTwo: Suit) {
        self.suitOne = suitOne
        self.suitTwo = suitTwo
    }

    /**
        Initializes a new domino with equal suits.

        - Parameter doubleSuit: The suit present on both ends of the domino

        - Returns: A domino with equal suits.
    */
    public init(doubleSuit: Suit) {
        suitOne = doubleSuit
        suitTwo = doubleSuit
    }

    // MARK: Functions

    /**
        Determines if the domino has a specific suit on either of its sides.

        - Parameter suit: The suit used to check for a match.

        - Returns: A Boolean value indicating if the domino has a specific suit
          on either of its sides.
    */
    public func hasMatchingSuit(_ suit: Suit) -> Bool {
        return suitOne == suit || suitTwo == suit
    }
}

// MARK: - Domino: Equatable

extension Domino: Equatable {}

/**
    Determines if two dominoes are equal.

    - Parameters:
        lhs: The first domino
        rhs: The second domino

    - Returns: A Boolean value indicating if the first and second domino are
      equal.
*/
public func ==(lhs: Domino, rhs: Domino) -> Bool {
    switch (lhs.suitOne, lhs.suitTwo, rhs.suitOne, rhs.suitTwo) {
    case (_, _, _, _) where lhs.suitOne == rhs.suitOne:
        return lhs.suitTwo == rhs.suitTwo
    case (_, _, _, _) where lhs.suitOne == rhs.suitTwo:
        return lhs.suitTwo == rhs.suitOne
    case (_, _, _, _) where lhs.suitTwo == rhs.suitOne:
        return lhs.suitOne == rhs.suitTwo
    case (_, _, _, _) where lhs.suitTwo == rhs.suitTwo:
        return lhs.suitOne == rhs.suitOne
    default:
        return false
    }
}

// MARK: - Domino: Comparable

extension Domino: Comparable {}

/**
    Compares two dominoes to determine if the first domino is less than the
    second domino.

    - Parameters:
        lhs: The first domino
        rhs: The second domino

    - Returns: A Boolean value indicating if the first domino is less than the
      second domino.
*/
public func <(lhs: Domino, rhs: Domino) -> Bool {
    return lhs.rank < rhs.rank
}

// MARK: - Domino: CustomStringConvertible

extension Domino: CustomStringConvertible {
    /// Textual representation of a domino.
    public var description: String {
        return "[\(suitOne)|\(suitTwo)]"
    }
}

// MARK: - Domino: Hashable

extension Domino: Hashable {
    /// Hash value of a domino.
    public var hashValue: Int {
        return (suitOne == .invalid || suitTwo == .invalid) ?
            -1 : suitOne.rawValue * 10 + suitTwo.rawValue * 1000
    }
}

import Foundation

// MARK: - Domino: ExpressibleByStringLiteral

extension Domino: ExpressibleByStringLiteral {

    /// Initializes a new domino from a string literal using the format [XY|XY].
    public init(unicodeScalarLiteral value: String) {
        let suits = Domino.suitsFromStringLiteral(value)
        suitOne = suits.0
        suitTwo = suits.1
    }

    /// Initializes a new domino from a string literal using the format [XY|XY].
    public init(extendedGraphemeClusterLiteral value: String) {
        let suits = Domino.suitsFromStringLiteral(value)
        suitOne = suits.0
        suitTwo = suits.1
    }

    /// Initializes a new domino from a string literal using the format [XY|XY].
    public init(stringLiteral value: String) {
        let suits = Domino.suitsFromStringLiteral(value)
        suitOne = suits.0
        suitTwo = suits.1
    }

    /**
        Generates two suit values (a tuple) from a string literal.

        - Parameter literal: A string literal.

        - Returns: A tuple containing two suits values to be used for the
          creation of a new domino.
    */
    private static func suitsFromStringLiteral(_ literal: String) -> (Suit, Suit) {
        let dominoMatchGroups = extractDominoMatchGroups(fromStringLiteral: literal)
        guard dominoMatchGroups.count == 3 else {
            return (.invalid, .invalid)
        }
        if let valueOne = Int(dominoMatchGroups[1]), let valueTwo = Int(dominoMatchGroups[2]) {
            return (Suit(value: valueOne)!, Suit(value: valueTwo)!)
        } else {
            return (.invalid, .invalid)
        }
    }

    /**
        Extracts regex groups from a string literal using a domino pattern.

        - Parameter fromStringLiteral: A string literal.

        - Returns: An array of strings representing the regex groups extracted
          from the string literal. The array may be empty if a valid match is
          not detected.
    */
    private static func extractDominoMatchGroups(fromStringLiteral: String) -> [String] {
#if os(Linux)
        let regex = try! RegularExpression(pattern: "^(\\[(0[0-9]|1[0-8])\\|(0[0-9]|1[0-8])\\])$", options: [])
#else
        let regex = try! NSRegularExpression(pattern: "^(\\[(0[0-9]|1[0-8])\\|(0[0-9]|1[0-8])\\])$", options: [])
#endif
        let nsString = NSString(string: fromStringLiteral)
        let all = NSRange(location: 0, length: nsString.length)

        let matches = regex.matches(in: fromStringLiteral, options: .reportCompletion, range: all)
        guard matches.count > 0 else {
            return [String]()
        }

        var results = [String]()
        for index in 1..<matches[0].numberOfRanges {
#if os(Linux)
            results.append(nsString.substring(with: matches[0].range(at: index)))
#else
            results.append(nsString.substring(with: matches[0].rangeAt(index)))
#endif
        }
        return results
    }
}
