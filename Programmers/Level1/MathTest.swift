//
//  MathTest.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/08.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level1) 모의고사
// - 1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return
// - 1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
// - 2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
// - 3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
//
// 예시
// - [1,2,3,4,5] -> [1]
// - [1,3,2,4,2] -> [1,2,3]

import Foundation

class MathTest {
    let students = [[1, 2, 3, 4, 5],
                    [2, 1, 2, 3, 2, 4, 2, 5],
                    [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    
    func solution(_ answers:[Int]) -> [Int] {
        var matched: [Int] = []
        var result: [Int] = []
        
        for student in students {
            let repeatCount = ceil(Double(answers.count) / Double(student.count))
            let studentAnswer = Array(repeating: student, count: Int(repeatCount)).flatMap{ $0 }
            let result = zip(answers, studentAnswer).filter(){ $0 == $1 }.count
            matched.append(result)
        }
        
        for index in 0..<matched.count {
            if matched.max() == matched[index] {
                result.append(index + 1)
            }
        }

        return result.sorted()
    }
}

// MARK: - Tests

/*
 func testMathTest_case1() {
     let mathTest = MathTest()
     let answers = [1,2,3,4,5]
     let students = [1]
     XCTAssertEqual(students, mathTest.solution(answers))
 }

 func testMathTest_case2() {
     let mathTest = MathTest()
     let answers = [1,3,2,4,2]
     let students = [1,2,3]
     XCTAssertEqual(students, mathTest.solution(answers))
 }
 
 func testMathTest_case3() {
     let mathTest = MathTest()
     let answers = [1,2,3,4,2,2,4,4,5,5]
     let students = [3]
     XCTAssertEqual(students, mathTest.solution(answers))
 }
 */
