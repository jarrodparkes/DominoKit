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
    public let highestSuit: Suit

    // MARK: Computed Properties

    public var count: Int {
        return dominoes.count
    }

    // MARK: Initializers

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

    private init(dominoes: [Domino], highestSuit: Suit) {
        self.dominoes = dominoes
        self.highestSuit = highestSuit
    }

    public static func standardSet(_ highestSuit: Suit) -> DominoSet {
        var dominoes: [Domino] = []
        for suitValueOne in 0...highestSuit.rawValue {
            for suitValueTwo in suitValueOne...highestSuit.rawValue {
                dominoes.append(Domino(suitOne: Suit(rawValue: suitValueOne)!,
                    suitTwo: Suit(rawValue: suitValueTwo)!))
            }
        }
        return DominoSet(dominoes: dominoes, highestSuit: highestSuit)
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
