//
//  Year2016.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/09.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level1) 2016
// - 2016년 1월 1일은 금요일입니다. 2016년 a월 b일은 무슨 요일일까요? 요일 이름 return
// - 2016년은 윤년
//
// 예시
// - a=1, b=7 -> THU
// - a=5, b=24 -> TUE

import Foundation

class Year2016 {
    let dayOfMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let dayOfWeek = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    
    func solution(_ a:Int, _ b:Int) -> String {
        let day = dayOfMonth[..<(a-1)].reduce(0, +) + b
        
        return dayOfWeek[(day-1) % 7]
    }
}

// MARK: - Tests

/*
 func test2016_case1() {
     let year2016 = Year2016()
     XCTAssertEqual("THU", year2016.solution(1, 7))
 }
 
 func test2016_case2() {
     let year2016 = Year2016()
     XCTAssertEqual("TUE", year2016.solution(5, 24))
 }
 */
