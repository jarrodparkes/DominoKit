@testable import DominoKit

import XCTest

class SuitTests: XCTestCase {
    func testSuitRawValue() {
        let values = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
        let suitRawValues = values.map{Suit(rawValue: $0)}.flatMap{$0?.rawValue}
        XCTAssertEqual(values, suitRawValues)
    }

    func testSuitDescription() {
        let suits = Suit.allValues
        for suit in suits {
            if suit.rawValue < 10 {
                XCTAssertEqual(String(describing: suit), "0\(suit.rawValue)")
            } else {
                XCTAssertEqual(String(describing: suit), "\(suit.rawValue)")
            }
        }
    }

    func testSuitComparable() {
        XCTAssertGreaterThan(Suit.two, Suit.zero)
        XCTAssertGreaterThan(Suit.eighteen, Suit.eight)
        XCTAssertGreaterThan(Suit.three, Suit.two)
        XCTAssertGreaterThan(Suit.ten, Suit.one)
    }
}
