//
//  QuadCompression.swift
//  programmers
//
//  Created by yurim on 2020/10/14.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level2) 쿼드압축 후 개수 세기
// - 2n x 2n 크기의 2차원 정수 배열 arr를 네 영역으로 나누어 모두 같은 수이면 하나로 압축한다.
// - 배열에 최종적으로 남는 0의 개수와 1의 개수를 배열에 담아서 return
// 1 1 0 0     1 1  0
// 1 0 0 0  => 1 0
// 1 0 0 1     1 0 0 1
// 1 1 1 1     1 1 1 1
//
// 예시
// - [[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]] -> [4,9]
// - [[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]] -> [10,15]

import Foundation

class QuadCompression {
    func solution(_ arr:[[Int]]) -> [Int] {
        var result: [Int] = [0, 0]
        
        func compress(_ doubleArr:[[Int]]) {
            let n = doubleArr.count/2
            
            for (i, j) in [(0, 0), (0, n), (n, 0), (n, n)] {
                var subArr: [[Int]] = []
                for index in 0..<n {
                    subArr.append(Array(doubleArr[i+index][j..<j+n]))
                }
                
                let zeroCount = subArr.flatMap{ $0 }.filter { $0 == 0 }.count
                if zeroCount == subArr.count * subArr.count {
                    result[0] += 1
                } else if zeroCount == 0 {
                    result[1] += 1
                } else {
                    compress(subArr)
                }
            }
        }
        
        let zeroCount = arr.flatMap { $0 }.filter { $0 == 0 }.count
        if zeroCount == arr.count * arr.count {
            result[0] += 1
        } else if zeroCount == 0 {
            result[1] += 1
        } else {
            compress(arr)
        }
        
        return result
    }
}

// MARK: - Tests

/*
 func testQuadCompression_case1() {
     let quad = QuadCompression()
     XCTAssertEqual([4,9], quad.solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]]))
 }
 
 func testQuadCompression_case2() {
     let quad = QuadCompression()
     XCTAssertEqual([10,15], quad.solution([[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]]))
 }
 
 func testQuadCompression_case3() {
     let quad = QuadCompression()
     XCTAssertEqual([0,1], quad.solution([[1]]))
 }
 
 func testQuadCompression_case4() {
     let quad = QuadCompression()
     XCTAssertEqual([0,1], quad.solution([[1, 1], [1, 1]]))
 }
 
 func testQuadCompression_case5() {
     let quad = QuadCompression()
     XCTAssertEqual([0,1], quad.solution([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]]))
 }
 */
