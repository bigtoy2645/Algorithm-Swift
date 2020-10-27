//
//  AddTwoInt.swift
//  programmers
//
//  Created by yurim on 2020/10/27.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level1) 두 정수 사이의 합
// -  a와 b 사이에 속한 모든 정수의 합을 리턴
//
// 예시
// - a = 3, b = 5인 경우, 3 + 4 + 5 = 12
// - a = 3, b = 3 -> 3
// - a = 5, b = 3 -> 12

import Foundation

class AddTwoInt {
    func solution(_ a:Int, _ b:Int) -> Int64 {
        var result: Int64 = 0
        
        if a < b {
            for value in (a...b) { result += Int64(value) }
        } else {
            for value in (b...a) { result += Int64(value) }
        }
        
        return result
    }
}

// MARK: - Tests

/*
 func testAddTwoInt_case1() {
     let add = AddTwoInt()
     XCTAssertEqual(12, add.solution(3, 5))
 }
 
 func testAddTwoInt_case2() {
     let add = AddTwoInt()
     XCTAssertEqual(3, add.solution(3, 3))
 }
 
 func testAddTwoInt_case3() {
     let add = AddTwoInt()
     XCTAssertEqual(12, add.solution(5, 3))
 }
 */
