//
//  ReverseBase3.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/13.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level1) 3진법 뒤집기
// - n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution
//
// 예시
// - 45 -> 1200 -> 0021 -> 7
// - 125 -> 11122 -> 22111 -> 229

import Foundation

class ReverseRadix3 {
    func solution(_ n:Int) -> Int {
        let radix3 = String(n, radix: 3, uppercase: false)
        let reverseString = String(radix3.reversed())
        return Int(reverseString, radix: 3) ?? 0
    }
}

// MARK: - Tests

/*
 func testReverseRadix3_case1() {
     let reverse = ReverseRadix3()
     XCTAssertEqual(7, reverse.solution(45))
 }
 
 func testReverseRadix3_case2() {
     let reverse = ReverseRadix3()
     XCTAssertEqual(229, reverse.solution(125))
 }
 */
