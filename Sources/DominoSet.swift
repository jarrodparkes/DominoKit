//
//  DominoSet.swift
//  DominoKit
//
//  Created by Jarrod Parkes on 1/31/17.
//  Copyright © 2017 Jarrod Parkes. All rights reserved.
//

// MARK: - DominoSet

/// A collection of dominoes that are only accessible one-at-a-time.
public class DominoSet {

    // MARK: Properties

    /// The collection of dominoes belonging to this set.
    fileprivate var dominoes: [Domino]

    /// The highest suit of all the dominoes in the set at the time of creation.
    public let highestSuit: Suit

    // MARK: Computed Properties

    /// The number of dominoes in the collection.
    public var count: Int {
        return dominoes.count
    }

    // MARK: Initializers

    /**
        Initializes a set of dominoes from a specified collection.

        - Parameter dominoes: A collection of dominoes

        - Returns: A set of dominoes containing all the dominoes from the
          specified collection.
    */
    init(_ dominoes: [Domino]) {
        self.dominoes = dominoes
        var highestSuitDetected = Suit.zero
        for domino in dominoes {
            if domino.suitOne.rawValue > highestSuitDetected.rawValue {
                highestSuitDetected = domino.suitOne
            }
            if domino.suitTwo.rawValue > highestSuitDetected.rawValue {
                highestSuitDetected = domino.suitTwo
            }
        }
        highestSuit = highestSuitDetected
    }

    /**
        Creates a standard set of dominoes.

        - Parameter highestSuit: The highest/largest suit represented in a
          standard set

        - Returns: A standard set of dominoes where the ends of the largest
          ranking double are equal to the specified suit.

    */
    public static func standardSet(_ highestSuit: Suit) -> DominoSet {
        var dominoes: [Domino] = []
        for suitValueOne in 0...highestSuit.rawValue {
            for suitValueTwo in suitValueOne...highestSuit.rawValue {
                dominoes.append(Domino(suitOne: Suit(rawValue: suitValueOne)!,
                    suitTwo: Suit(rawValue: suitValueTwo)!))
            }
        }
        return DominoSet(dominoes)
    }

    // MARK: Dealing

    /// Randomly shuffles all dominoes in the set.
    public func shuffle() {
        dominoes.shuffle()
    }

    /**
        Deals a domino from the set, if one exists.

        - Returns: A domino from the set, if one exists.
    */
    public func deal() -> Domino? {
        guard !dominoes.isEmpty else { return nil }
        return dominoes.removeLast()
    }
}

// MARK: - DominoSet: Equatable

extension DominoSet: Equatable {}

/**
    Determines if two domino sets are equal, i.e. contain all the same dominoes.

    - Parameters:
        lhs: The first domino set
        rhs: The second domino set

    - Returns: A Boolean value indicating if the first and second domino sets
      are equal.
*/
public func ==(lhs: DominoSet, rhs: DominoSet) -> Bool {
    return lhs.dominoes == rhs.dominoes
}
