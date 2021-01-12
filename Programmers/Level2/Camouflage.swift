//
//  Camouflage.swift
//  programmers
//
//  Created by yurim on 2021/01/11.
//  Copyright © 2021 yurim. All rights reserved.
//
// Level2) 위장
// 스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return
//
// 예시
// - [[yellow_hat, headgear], [blue_sunglasses, eyewear], [green_turban, headgear]] -> 5
// 1. yellow_hat
// 2. blue_sunglasses
// 3. green_turban
// 4. yellow_hat + blue_sunglasses
// 5. green_turban + blue_sunglasses
//
// - [[crow_mask, face], [blue_sunglasses, face], [smoky_makeup, face]] -> 3
// 1. crow_mask
// 2. blue_sunglasses
// 3. smoky_makeup

// [["a", "1"], ["b", "1"], ["c", "2"], ["d", "3"], ["e", "3"]]

import Foundation

class Camouflage {
    
    func solution(_ clothes:[[String]]) -> Int {
        var types: [String : Int] = [:]
        
        for clothe in clothes {
            let type = clothe[1]
            let value = types[type] ?? 0
            types.updateValue(value+1, forKey: type)
        }
        
        let result = types.values.reduce(1) { $0 * ($1+1) }
        
        return result-1
    }
}

// MARK: - Tests

/*
 func testCamouflage_case1() {
     let camouflage = Camouflage()
     XCTAssertEqual(17, camouflage.solution([["a", "1"], ["b", "1"], ["c", "2"], ["d", "3"], ["e", "3"]]))
 }
 
 func testCamouflage_case2() {
     let camouflage = Camouflage()
     XCTAssertEqual(5, camouflage.solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
 }
 */
