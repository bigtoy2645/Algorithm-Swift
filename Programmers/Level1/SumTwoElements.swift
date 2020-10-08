//
//  SumTwoElements.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/08.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level1) 두 개 뽑아서 더하기
// - numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return
//
// 예시
// - [2,1,3,4,1] -> [2,3,4,5,6,7]
// - [5,0,2,7] -> [2,5,7,9,12]

import Foundation

class SumTwoElements {
    func solution(_ numbers:[Int]) -> [Int] {
        var setTwoSum = Set<Int>()
        
        for index in 0..<numbers.count {
            for subIndex in index+1..<numbers.count {
                setTwoSum.insert(numbers[index] + numbers[subIndex])
            }
        }
        return setTwoSum.sorted()
    }
}

// MARK: - Tests

/*
 func testSumTwoElements_case1() {
     let sumTwoElements = SumTwoElements()
     let numbers = [2,1,3,4,1]
     let expected = [2,3,4,5,6,7]
     let actual = sumTwoElements.solution(numbers)
     XCTAssertEqual(expected, actual)
 }
 
 func testSumTwoElements_case2() {
     let sumTwoElements = SumTwoElements()
     let numbers = [5,0,2,7]
     let expected = [2,5,7,9,12]
     let actual = sumTwoElements.solution(numbers)
     XCTAssertEqual(expected, actual)
 }
 */
