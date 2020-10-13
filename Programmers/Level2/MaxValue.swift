//
//  MaxValue.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/13.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level2) 가장 큰 수
// - 정수를 이어 붙여 만들 수 있는 가장 큰 수를 문자열로 return
//
// 예시
// - [6, 10, 2] -> 6210
// - [3, 30, 34, 5, 9] -> 9534330

import Foundation

class MaxValue {
    // MARK: - 성공
    func solution(_ numbers:[Int]) -> String {
        let stringNumbers = numbers.sorted() { "\($0)\($1)" > "\($1)\($0)" }.map { String($0) }
        return stringNumbers[0] == "0" ? "0" : stringNumbers.joined()
    }
    
    // MARK: - 실패
    // 3차 답안 : 1, 2, 3, 5, 6 실패
//    func solution(_ numbers:[Int]) -> String {
//        let stringNumbers = numbers.map { String($0) }
//        var sortedNumbers: [String] = []
//        var isLast = true
//
//        for number in stringNumbers {
//            isLast = true
//            if number != "0" {
//                for (index, value) in sortedNumbers.enumerated() {
//                    if "\(number)\(value)" >= "\(value)\(number)" {
//                        sortedNumbers.insert(number, at: index)
//                        isLast = false
//                        break
//                    }
//                }
//            }
//
//            if isLast == true { sortedNumbers.append(number) }
//        }
//
//        return sortedNumbers[0] == "0" ? "0" : sortedNumbers.joined()
//    }
    
    // 2차 답안 : 1, 2, 3, 5, 6, 11 실패
//    func solution(_ numbers:[Int]) -> String {
//        var stringNumbers = numbers.map { String($0) }
//        var value = ""
//
//        for _ in 1..<stringNumbers.count {
//            for index in 1..<stringNumbers.count {
//                if stringNumbers[index-1] == stringNumbers[index] { continue }
//                if "\(stringNumbers[index])\(stringNumbers[index-1])" > "\(stringNumbers[index-1])\(stringNumbers[index])" {
//                    value = stringNumbers[index-1]
//                    stringNumbers[index-1] = stringNumbers[index]
//                    stringNumbers[index] = value
//                }
//            }
//        }
//
//        return stringNumbers.joined()
//    }
    
    // 1차 답안 : 1, 2, 3, 5, 11 실패
//    func solution(_ numbers:[Int]) -> String {
//        let stringNumbers = numbers.map { String($0) }
//        var sortedNumbers: [String] = []
//        for number in stringNumbers {
//            var isLast = true
//            for (index, value) in sortedNumbers.enumerated() {
//                if "\(number)\(value)" >= "\(value)\(number)" {
//                    sortedNumbers.insert(number, at: index)
//                    isLast = false
//                    break
//                }
//            }
//            if isLast == true { sortedNumbers.append(number) }
//        }
//
//        return sortedNumbers.joined()
//    }
}

// MARK: - Tests

/*
 func testMaxValue_case1() {
     let maxValue = MaxValue()
     XCTAssertEqual("6210", maxValue.solution([6, 10, 2]))
 }
 
 func testMaxValue_case2() {
     let maxValue = MaxValue()
     XCTAssertEqual("9534330", maxValue.solution([3, 30, 34, 5, 9]))
 }
 
 func testMaxValue_case3() {
     let maxValue = MaxValue()
     XCTAssertEqual("70000", maxValue.solution([70,0,0,0]))
 }
 
 func testMaxValue_case4() {
     let maxValue = MaxValue()
     XCTAssertEqual("1111111111", maxValue.solution([1, 11, 111, 1111]))
 }
 
 func testMaxValue_case5() {
     let maxValue = MaxValue()
     XCTAssertEqual("222020", maxValue.solution([2, 20, 220]))
 }
 
 func testMaxValue_case6() {
     let maxValue = MaxValue()
     XCTAssertEqual("0", maxValue.solution([0, 0, 0, 0]))
 }
 
 func testMaxValue_case7() {
     let maxValue = MaxValue()
     XCTAssertEqual("3333130", maxValue.solution([3, 30, 31, 33]))
 }
 */
