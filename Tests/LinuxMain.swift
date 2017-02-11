@testable import DominoKitTestSuite

import XCTest

XCTMain([
    testCase(RandomTests.allTests),
    testCase(ShuffleTests.allTests),
    testCase(SuitTests.allTests),
    testCase(DominoTests.allTests),
    testCase(DominoSetTests.allTests)
])
