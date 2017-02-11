//
//  Pod+Random.swift
//  DominoKit
//
//  Created by Jarrod Parkes on 1/31/17.
//  Copyright © 2017 Jarrod Parkes. All rights reserved.
//

/// Generates a random unsigned integer.
public let random: (Int) -> Int = {
    let unsigned = $0 < 0 ? $0 * -1 : $0
    return Int(arc4random_uniform(UInt32(unsigned)))
}
