@testable import DominoKit

import XCTest

// MARK: - DominoSetTests: XCTestCase

class DominoSetTests: XCTestCase {
    func testDominoSetInit() {
        let highestSuit = Suit.six
        var ranks = [Int: Bool]()
        var doubleSixSet = DominoSet.standardSet(highestSuit)

        XCTAssertEqual(doubleSixSet.count,
            (highestSuit.rawValue + 1) * (highestSuit.rawValue + 2) / 2)
        XCTAssertEqual(doubleSixSet.highestSuit, highestSuit)

        for suitValueOne in 0...highestSuit.rawValue {
            for suitTwoValue in suitValueOne...suitValueOne {
                ranks[suitValueOne * 10 + suitTwoValue * 1000] = false
            }
        }
        while let domino = doubleSixSet.deal() {
            ranks[domino.hashValue] = true
        }

        for (_, rankFound) in ranks {
            XCTAssert(rankFound)
        }
    }

    func testDominoSetHighestSuit() {
        let dominoSet0 = DominoSet([Domino(doubleSuit: .fifteen), Domino(doubleSuit: .two)])
        let dominoSet1 = DominoSet([Domino(doubleSuit: .zero), Domino(suitOne: .one, suitTwo: .three)])

        XCTAssertEqual(dominoSet0.highestSuit, .fifteen)
        XCTAssertEqual(dominoSet1.highestSuit, .three)
    }

    func testDominoSetCount() {
        var dominoSet = DominoSet([Domino(doubleSuit: .zero), Domino(doubleSuit: .six)])

        XCTAssertEqual(dominoSet.count, 2)
        let _ = dominoSet.deal()
        XCTAssertEqual(dominoSet.count, 1)
        let _ = dominoSet.deal()
        XCTAssertEqual(dominoSet.count, 0)
    }

    func testDominoSetDeal() {
        let doubleSix = Domino(doubleSuit: .six)
        var dominoSet = DominoSet([doubleSix])

        XCTAssertEqual(dominoSet.deal(), doubleSix)
        XCTAssertNil(dominoSet.deal())
    }
}
