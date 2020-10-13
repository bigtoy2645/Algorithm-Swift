//
//  TriangularSnail.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/13.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level2) 삼각 달팽이
// - 밑변의 길이와 높이가 n인 삼각형에서 맨 위 꼭짓점부터 반시계 방향으로 달팽이 채우기를 진행한 후, 첫 행부터 마지막 행까지 모두 순서대로 합친 새로운 배열을 return
//   1
//  2 6
// 3 4 5
//
// 예시
// n = 4 -> [1,2,9,3,10,8,4,5,6,7]
// n = 5 -> [1,2,12,3,13,11,4,14,15,10,5,6,7,8,9]
// n = 6 -> [1,2,15,3,16,14,4,17,21,13,5,18,19,20,12,6,7,8,9,10,11]

import Foundation

class TriangularSnail {
    func solution(_ n:Int) -> [Int] {
        var numbers = [[Int]](repeating: [], count: n)
        var nextNumber = 1
        let lastIndex = numbers.count - 1
        
        for order in 0..<n {
            let round = order / 3
            switch order % 3 {
            case 0:
                for index in 2*round..<n-round {
                    numbers[index].insert(nextNumber, at: round)
                    nextNumber += 1
                }
            case 1:
                numbers[lastIndex-round].insert(contentsOf: nextNumber..<nextNumber+lastIndex-3*round, at: round+1)
                nextNumber += lastIndex-3*round
            case 2:
                for index in (1+round*2..<lastIndex-round).reversed() {
                    numbers[index].insert(nextNumber, at: numbers[index].endIndex-round )
                    nextNumber += 1
                }
            default:
                break
            }
        }
        
        return numbers.flatMap { $0 }
    }
}

// MARK: - Tests

/*
 func testTriangleSnail_case1() {
     let snail = TriangularSnail()
     XCTAssertEqual([1,2,9,3,10,8,4,5,6,7], snail.solution(4))
 }
 
 func testTriangleSnail_case2() {
     let snail = TriangularSnail()
     XCTAssertEqual([1,2,12,3,13,11,4,14,15,10,5,6,7,8,9], snail.solution(5))
 }
 
 func testTriangleSnail_case3() {
     let snail = TriangularSnail()
     XCTAssertEqual([1,2,15,3,16,14,4,17,21,13,5,18,19,20,12,6,7,8,9,10,11], snail.solution(6))
 }
 */
