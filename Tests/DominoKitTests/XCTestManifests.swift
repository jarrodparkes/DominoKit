extension SuitTests {

    static var allTests = [
        ("testSuitRawValue", testSuitRawValue),
        ("testSuitDescription", testSuitDescription),
        ("testSuitComparable", testSuitComparable)
    ]
}

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
    ]
}
