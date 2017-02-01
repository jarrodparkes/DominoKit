//
//  DominoSet.swift
//  DominoKit
//
//  Created by Jarrod Parkes on 1/31/17.
//  Copyright © 2017 Jarrod Parkes. All rights reserved.
//

import FisherYates

// MARK: - DominoSet

public struct DominoSet {

    // MARK: Properties

    fileprivate var dominoes: [Domino]

    // MARK: Computed Properties

    public var count: Int {
        return dominoes.count
    }

    // MARK: Initializers

    public init(_ dominoes: [Domino]) {
        self.dominoes = dominoes
    }

    public static func standardSet(_ highestSuit: Suit) -> DominoSet {

        var dominoes: [Domino] = []
        for suitValueOne in 0...highestSuit.rawValue {
            for suitValueTwo in 0...suitValueOne {
                dominoes.append(Domino(suitOne: Suit(rawValue: suitValueOne)!,
                    suitTwo: Suit(rawValue: suitValueTwo)!))
            }
        }

        return DominoSet(dominoes)
    }

    // MARK: Mutators

    public mutating func shuffle() {
        dominoes.shuffle()
    }

    public mutating func deal() -> Domino? {
        guard !dominoes.isEmpty else { return nil }
        return dominoes.removeLast()
    }
}

// MARK: - DominoSet: ExpressibleByArrayLiteral

extension DominoSet: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Domino...) {
        self.init(elements)
    }
}

// MARK: - DominoSet: Equatable

extension DominoSet: Equatable {}

public func ==(lhs: DominoSet, rhs: DominoSet) -> Bool {
    return lhs.dominoes == rhs.dominoes
}
