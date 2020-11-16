//
//  TargetNumber.swift
//  programmers
//
//  Created by yurim on 2020/11/16.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level2) 타겟 넘버
// - 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return
//
// 예시
// - [1, 1, 1, 1, 1], target = 3 -> 5
// -1+1+1+1+1 = 3
// +1-1+1+1+1 = 3
// +1+1-1+1+1 = 3
// +1+1+1-1+1 = 3
// +1+1+1+1-1 = 3

import Foundation

class TargetNumber {
    
    func convertBinary(string : String, toSize: Int) -> [Int] {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded.map { if "0" == $0 { return -1 } else { return 1 } }
    }
    
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        var caseCount = 0
        
        let allCase = Int(pow(Double(2), Double(numbers.count)))
        for index in 0..<allCase {
            let arrBinary = convertBinary(string: String(index, radix: 2), toSize: numbers.count)
            var sum = 0
            
            for subIndex in 0..<numbers.count {
                sum += numbers[subIndex] * arrBinary[subIndex]
            }
            if sum == target { caseCount += 1 }
        }
        
        return caseCount
    }
}

// MARK: - Tests

/*
 func testTargetNumber_case1() {
     let targetNumber = TargetNumber()
     XCTAssertEqual(5, targetNumber.solution([1, 1, 1, 1, 1], 3))
 }
 */
