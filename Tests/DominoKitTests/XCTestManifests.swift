// MARK: - SuitTests (All Tests)

extension SuitTests {

    static var allTests = [
        ("testSuitRawValue", testSuitRawValue),
        ("testSuitFromZeroTo", testSuitFromZeroTo),
        ("testSuitDescription", testSuitDescription),
        ("testSuitComparable", testSuitComparable)
    ]
}

// MARK: - DominoTests (All Tests)

extension DominoTests {

    static var allTests = [
        ("testDominoInit", testDominoInit),
        ("testDominoDoubleInit", testDominoDoubleInit),
        ("testDominoRank", testDominoRank),
        ("testDominoIsDouble", testDominoIsDouble),
        ("testDominoIsSingle", testDominoIsSingle),
        ("testDominoSuits", testDominoSuits),
        ("testDominoHasMatchingSuit", testDominoHasMatchingSuit),        
        ("testDominoEquatable", testDominoEquatable),
        ("testDominoHashable", testDominoHashable)
    ]
}

// MARK: - DominoSetTests (All Tests)

extension DominoSetTests {

    static var allTests = [
        ("testDominoSetInit", testDominoSetInit),
        ("testDominoSetHighestSuit", testDominoSetHighestSuit),
        ("testDominoSetCount", testDominoSetCount),
        ("testDominoSetDeal", testDominoSetDeal)
    ]
}
