//
//  Bracket.swift
//  programmers
//
//  Created by yurim on 2020/10/25.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level2) 올바른 괄호
// - '(' 또는 ')' 로만 이루어진 문자열 s가 주어졌을 때, 문자열 s가 올바른 괄호이면 true를 return 하고, 올바르지 않은 괄호이면 false를 return
//
// 예시
// - ()() -> true
// - (())() -> true
// - )()( -> false
// - (()(. -> false

import Foundation

class Bracket {
    func solution(_ s:String) -> Bool {
        var left = 0
        var right = 0
        
        for letter in s {
            if letter == "(" {
                left += 1
            } else if letter == ")" {
                right += 1
            }
            
            if left < right {
                return false
            }
        }
        
        return left == right
    }
}

// MARK: - Tests

/*
 func testBracket_case1() {
     let bracket = Bracket()
     XCTAssertEqual(true,bracket.solution("()()"))
 }
 
 func testBracket_case2() {
     let bracket = Bracket()
     XCTAssertEqual(true,bracket.solution("(())()"))
 }
 
 func testBracket_case3() {
     let bracket = Bracket()
     XCTAssertEqual(false,bracket.solution(")()("))
 }
 
 func testBracket_case4() {
     let bracket = Bracket()
     XCTAssertEqual(false,bracket.solution("(()(."))
 }
 */
