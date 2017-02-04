@testable import DominoKit

import XCTest

// MARK: - DominoTests: XCTestCase

class DominoTests: XCTestCase {
    func testDominoInit() {
        for suitOne in Suit.allValues {
            for suitTwo in Suit.allValues {
                let domino = Domino(suitOne: suitOne, suitTwo: suitTwo)
                XCTAssertEqual(domino.suitOne, suitOne)
                XCTAssertEqual(domino.suitTwo, suitTwo)
            }
        }
    }

    func testDominoDoubleInit() {
        for suit in Suit.allValues {
            let double = Domino(doubleSuit: suit)
            XCTAssertEqual(double.suitOne, suit)
            XCTAssertEqual(double.suitTwo, suit)
        }
    }

    func testDominoRank() {
        let doubleSix = Domino(doubleSuit: .six)
        let twoFive = Domino(suitOne: .two, suitTwo: .five)
        let doubleZero = Domino(doubleSuit: .zero)
        let eighteenFour = Domino(suitOne: .eighteen, suitTwo: .four)
        let doubleEighteen = Domino(doubleSuit: .eighteen)

        XCTAssertEqual(doubleSix.rank, 12)
        XCTAssertEqual(twoFive.rank, 7)
        XCTAssertEqual(doubleZero.rank, 0)
        XCTAssertEqual(eighteenFour.rank, 22)
        XCTAssertEqual(doubleEighteen.rank, 36)
    }

    func testDominoIsDouble() {
        let doubleSix = Domino(doubleSuit: .six)
        let twoFive = Domino(suitOne: .two, suitTwo: .five)
        let fourEighteen = Domino(suitOne: .four, suitTwo: .eighteen)

        XCTAssert(doubleSix.isDouble)
        XCTAssert(!twoFive.isDouble)
        XCTAssert(!fourEighteen.isDouble)
    }

    func testDominoIsSingle() {
        let doubleSix = Domino(doubleSuit: .six)
        let twoFive = Domino(suitOne: .two, suitTwo: .five)
        let fourEighteen = Domino(suitOne: .four, suitTwo: .eighteen)

        XCTAssert(!doubleSix.isSingle)
        XCTAssert(twoFive.isSingle)
        XCTAssert(fourEighteen.isSingle)
    }

    func testDominoSuits() {
        let doubleSix = Domino(doubleSuit: .six)
        let twoFivesSuits = Domino(suitOne: .two, suitTwo: .five).suits
        let fourEighteenSuits = Domino(suitOne: .four, suitTwo: .eighteen).suits

        XCTAssertEqual(doubleSix.suits, [.six, .six])
        XCTAssert(twoFivesSuits.contains(.two))
        XCTAssert(twoFivesSuits.contains(.five))
        XCTAssert(fourEighteenSuits.contains(.four))
        XCTAssert(fourEighteenSuits.contains(.eighteen))
    }

    func testDominoHasMatchingSuit() {
        let doubleFive = Domino(doubleSuit: .five)
        let twoFive = Domino(suitOne: .two, suitTwo: .five)
        let doubleFour = Domino(doubleSuit: .four)

        XCTAssert(twoFive.hasMatchingSuit(.five))
        XCTAssert(twoFive.hasMatchingSuit(doubleFive.suitOne))
        XCTAssert(!doubleFive.hasMatchingSuit(twoFive.suitOne))
        XCTAssert(!doubleFour.hasMatchingSuit(doubleFive.suitOne))
    }

    func testDominoHasMatchingSuitWithDomino() {
        let doubleFive = Domino(doubleSuit: .five)
        let twoFive = Domino(suitOne: .two, suitTwo: .five)
        let fiveZero = Domino(suitOne: .five, suitTwo: .zero)
        let doubleFour = Domino(doubleSuit: .four)

        XCTAssert(twoFive.hasMatchingSuit(withDomino: doubleFive))
        XCTAssert(fiveZero.hasMatchingSuit(withDomino: doubleFive))
        XCTAssert(!doubleFour.hasMatchingSuit(withDomino: doubleFive))
    }

    func testDominoEquatable() {
        let doubleFive = Domino(doubleSuit: .five)
        let twoFive = Domino(suitOne: .two, suitTwo: .five)
        let fiveTwo = Domino(suitOne: .five, suitTwo: .two)

        XCTAssertNotEqual(doubleFive, fiveTwo)
        XCTAssertEqual(twoFive, fiveTwo)
    }

    func testDominoHashable() {
        let oneEight = Domino(suitOne: .eight, suitTwo: .one)
        let eighteenZero = Domino(suitOne: .eighteen, suitTwo: .zero)
        let doubleFive = Domino(doubleSuit: .five)
        let threeEighteen = Domino(suitOne: .three, suitTwo: .eighteen)

        XCTAssertEqual(oneEight.hashValue, 1080)
        XCTAssertEqual(eighteenZero.hashValue, 180)
        XCTAssertEqual(doubleFive.hashValue, 5050)
        XCTAssertEqual(threeEighteen.hashValue, 18030)
    }
}
