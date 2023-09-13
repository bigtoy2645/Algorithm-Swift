//
//  File.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/09/13.
//

import Foundation

func rockGame() {
    var N = Int(readLine()!)!
    var count = 0

    while N > 0 {
        count += 1
        if N >= 3 { N = N - 3 }
        else      { N = N - 1 }
    }

    let isSk = count % 2 != 0
    print("\(isSk ? "SK" : "CY")")
}
