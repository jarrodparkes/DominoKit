/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if os(OSX)
    import Darwin

    public let random: (Int) -> Int = {
        let unsigned = $0 < 0 ? $0 * -1 : $0
        return Int(arc4random_uniform(UInt32(unsigned)))
    }
#else
    import Glibc

    public let random: (Int) -> Int = {
        let unsigned = $0 < 0 ? $0 * -1 : $0
        while true {
            let x = Glibc.random() % unsigned
            let y = Glibc.random() % unsigned
            guard x == y else { return x }
        }
    }
#endif
