//
//  FindPrimeNumber.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/13.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level1) 소수찾기
// - 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution
//
// 예시
// - 10 -> [2,3,5,7] -> 4
// - 5 -> [2,3,5] -> 3

import Foundation

class FindPrimeNumber {
    // MARK: - 성공
    func solution(_ n:Int) -> Int {
        if n == 2 { return 1 }
        var numbers = [Bool](repeating: true, count: n+1)
        numbers[0] = false
        numbers[1] = false
        
        for divide in 2...Int(n/2) {
            for multiple in stride(from: divide, through: n, by: divide) {
                if numbers[multiple] == false { continue }
                if multiple == divide { continue }
                if multiple % divide == 0 { numbers[multiple] = false }
            }
        }
        
        return numbers.filter { $0 }.count
    }
    
    // MARK: - 실패
    // 1차 답안 : 10, 11, 12 실패
//    func solution(_ n:Int) -> Int {
//        var numbers = Array(2...n)
//        for value in numbers {
//            numbers = numbers.filter { ($0 == value) || ($0 % value != 0) }
//        }
//
//        return numbers.count
//    }
}

// MARK: - Tests

/*
 func testFindPrimeNumber_case1() {
     let prime = FindPrimeNumber()
     XCTAssertEqual(4, prime.solution(10))
 }
 
 func testFindPrimeNumber_case2() {
     let prime = FindPrimeNumber()
     XCTAssertEqual(3, prime.solution(5))
 }
 */
