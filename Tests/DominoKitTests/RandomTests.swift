@testable import DominoKit

import XCTest

// MARK: - RandomTests: XCTestCase

class RandomTests: XCTestCase {
    func testRandom() {
        let zeroToTen = random(10) + 1
        let zeroToTenWithNegative = random(-10) + 1

        XCTAssertGreaterThanOrEqual(zeroToTen, 0)
        XCTAssertLessThanOrEqual(zeroToTen, 10)
        XCTAssertGreaterThanOrEqual(zeroToTenWithNegative, 0)
        XCTAssertLessThanOrEqual(zeroToTenWithNegative, 10)
    }
}
