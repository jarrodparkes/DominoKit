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

        for suitValueOne in 0...highestSuit.rawValue {
            for suitTwoValue in 0...suitValueOne {
                ranks[suitValueOne * 10 + suitTwoValue * 100] = false
            }
        }
        while let domino = doubleSixSet.deal() {
            ranks[domino.suitOne.rawValue * 10 + domino.suitTwo.rawValue * 100] = true
        }

        for (_, rankFound) in ranks {
            XCTAssert(rankFound)
        }
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
