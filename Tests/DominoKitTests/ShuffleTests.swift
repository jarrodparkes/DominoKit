@testable import DominoKit

import XCTest

// MARK: - ShuffleTests: XCTestCase

class ShuffleTests: XCTestCase {
    func testShuffled() {
        var values = [3, 4, 5, 6, 7, 1, 2, 8, 9, 10, 11, 12, 2, 3, 4, 5, 6, 7,
            8, 9, 10, 11, 12]
        var count =  0

        for _ in 0..<1000 {
            let valuesCopy = values.shuffled()

            if (values != valuesCopy && values.count == valuesCopy.count &&
                values.reduce(0, +) == valuesCopy.reduce(0, +)) {
                count += 1
            }
            values = valuesCopy
        }
        let result = Double(count) / 1000.00
        XCTAssertEqualWithAccuracy(result, 1, accuracy: 0.02)
    }
}
