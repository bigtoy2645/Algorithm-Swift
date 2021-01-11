//
//  Carpet.swift
//  programmers
//
//  Created by yurim on 2021/01/11.
//  Copyright © 2021 yurim. All rights reserved.
//
// Level2) 카펫
// 카펫에서 갈색 격자의 수 brown, 노란색 격자의 수 yellow가 매개변수로 주어질 때 카펫의 가로, 세로 크기를 순서대로 배열에 담아 return
//
// 예시
// - 10, 2  -> [4, 3]
// - 8, 1   -> [3, 3]
// - 24, 24 -> [8, 6]

import Foundation

class Carpet {
    
    func solution(_ brown:Int, _ yellow:Int) -> [Int] {
        let cellCount = brown + yellow
        var width = 0, height = 0
        
        for index in 3...cellCount/2 {
            width = cellCount / index
            height = index
            if yellow == (width-2) * (height-2) {
                break
            }
        }
        
        return [width, height]
    }
}

// MARK: - Tests

/*
 func testCarpet_case1() {
     let carpet = Carpet()
     XCTAssertEqual([4, 3], carpet.solution(10, 2))
 }
 
 func testCarpet_case2() {
     let carpet = Carpet()
     XCTAssertEqual([3, 3], carpet.solution(8, 1))
 }
 
 func testCarpet_case3() {
     let carpet = Carpet()
     XCTAssertEqual([8, 6], carpet.solution(24, 24))
 }
 */
