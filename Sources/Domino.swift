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

    public func matches(_ domino: Domino) -> Bool {
        return (suitOne == domino.suitOne && suitTwo == domino.suitTwo) ||
            (suitOne == domino.suitTwo && suitTwo == domino.suitOne)
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
        return suitOne.rawValue * 10 + suitTwo.rawValue * 1000
    }
}
