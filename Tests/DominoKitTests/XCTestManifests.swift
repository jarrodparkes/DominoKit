// MARK: - RandomTests (All Tests)

extension RandomTests {

    static var allTests = [
        ("testRandom", testRandom)
    ]
}

// MARK: - ShuffleTests (All Tests)

extension ShuffleTests {

    static var allTests = [
        ("testShuffled", testShuffled)
    ]
}

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
        ("testDominoInitFromStringLiteral", testDominoInitFromStringLiteral),
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
        ("testDominoSetDeal", testDominoSetDeal),
        ("testDominoSetEquality", testDominoSetEquality)
    ]
}
