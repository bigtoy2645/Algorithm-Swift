//
//  lesson1-BinaryGap.swift
//  codility
//
//  Created by yurim on 2021/04/14.
//
// Iterations) BinaryGap
/*
 A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

 For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.

 Write a function:
 public func solution(_ N : Int) -> Int

 that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
 For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.
 
 Write an efficient algorithm for the following assumptions:
 N is an integer within the range [1..2,147,483,647].
 
 9 -> 1001 -> 2
 20 -> 10100 -> 1
 529 -> 1000010001 -> 4
 
 results : 15m / 100%
 */

import Foundation
//import Glibc

public func lesson1_BinaryGap_solution(_ N : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let n16 = Array(String(N, radix: 2))
    var gap = 0, result = 0
    
    for i in 0..<n16.count {
        if n16[i] == "1" {
            if gap > result {
                result = gap
            }
            gap = 0
        } else {
            gap += 1
        }
    }
    
    return result
}

