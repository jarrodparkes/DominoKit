//
//  Domino.swift
//  DominoKit
//
//  Created by Jarrod Parkes on 1/31/17.
//  Copyright © 2017 Jarrod Parkes. All rights reserved.
//

// MARK: - Domino

public struct Domino {

    // MARK: Properties

    public let suitOne: Suit
    public let suitTwo: Suit

    // MARK: Computed Properties

    public var rank: Int {
        return suitOne.rawValue + suitTwo.rawValue
    }

    public var isDouble: Bool {
        return suitOne.rawValue == suitTwo.rawValue
    }

    public var isSingle: Bool {
        return !isDouble
    }

    public var suits: [Suit] {
        return [suitOne, suitTwo]
    }

    // MARK: Initializers

    public init(suitOne: Suit, suitTwo: Suit) {
        self.suitOne = suitOne
        self.suitTwo = suitTwo
    }

    public init(doubleSuit: Suit) {
        suitOne = doubleSuit
        suitTwo = doubleSuit
    }

    // MARK: Functions

    public func hasMatchingSuit(_ suit: Suit) -> Bool {
        return suitOne == suit || suitTwo == suit
    }
}

// MARK: - Domino: Equatable

extension Domino: Equatable {}

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

public func <(lhs: Domino, rhs: Domino) -> Bool {
    return lhs.rank < rhs.rank
}

// MARK: - Domino: CustomStringConvertible

extension Domino: CustomStringConvertible {
    public var description: String {
        return "[\(suitOne)|\(suitTwo)]"
    }
}

// MARK: - Domino: Hashable

extension Domino: Hashable {
    public var hashValue: Int {
        return (suitOne == .invalid || suitTwo == .invalid) ?
            -1 : suitOne.rawValue * 10 + suitTwo.rawValue * 1000
    }
}

import Foundation

// MARK: - Domino: ExpressibleByStringLiteral

extension Domino: ExpressibleByStringLiteral {

    public init(unicodeScalarLiteral value: String) {
        let suits = Domino.suitsFromStringLiteral(value)
        suitOne = suits.0
        suitTwo = suits.1
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        let suits = Domino.suitsFromStringLiteral(value)
        suitOne = suits.0
        suitTwo = suits.1
    }

    public init(stringLiteral value: String) {
        let suits = Domino.suitsFromStringLiteral(value)
        suitOne = suits.0
        suitTwo = suits.1
    }

    private static func suitsFromStringLiteral(_ literal: String) -> (Suit, Suit) {
        let dominoMatchGroups = extractDominoMatchGroups(fromString: literal)
        guard dominoMatchGroups.count == 3 else {
            return (.invalid, .invalid)
        }
        if let valueOne = Int(dominoMatchGroups[1]), let valueTwo = Int(dominoMatchGroups[2]) {
            return (Suit(value: valueOne)!, Suit(value: valueTwo)!)
        } else {
            return (.invalid, .invalid)
        }
    }

    private static func extractDominoMatchGroups(fromString: String) -> [String] {
#if os(Linux)
        let regex = try! RegularExpression(pattern: "^(\\[(0[0-9]|1[0-8])\\|(0[0-9]|1[0-8])\\])$", options: [])
#else
        let regex = try! NSRegularExpression(pattern: "^(\\[(0[0-9]|1[0-8])\\|(0[0-9]|1[0-8])\\])$", options: [])
#endif
        let nsString = NSString(string: fromString)
        let all = NSRange(location: 0, length: nsString.length)

        let matches = regex.matches(in: fromString, options: .reportCompletion, range: all)
        guard matches.count > 0 else {
            return [String]()
        }

        var results = [String]()
        for index in 1..<matches[0].numberOfRanges {
            results.append(nsString.substring(with: matches[0].rangeAt(index)))
        }
        return results
    }
}
