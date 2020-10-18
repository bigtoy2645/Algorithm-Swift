//
//  Printer.swift
//  programmers
//
//  Created by yurim on 2020/10/18.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level2) 프린터
// 1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
// 2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
// 3. 그렇지 않으면 J를 인쇄합니다.
//
// 예시
// - [2, 1, 3, 2], 2 -> 1
// - [1, 1, 9, 1, 1, 1], 0 -> 5

import Foundation

class Printer {
    func solution(_ priorities:[Int], _ location:Int) -> Int {
        var lists = priorities.map { ($0, false) }
        lists[location].1 = true
        var result = 0
        
        while lists.isEmpty == false {
            let context = lists.removeFirst()
            if let maxValue = lists.max(by: { $0.0 < $1.0 }), maxValue.0 > context.0 {
                lists.append(context)
            } else {
                result += 1
                if context.1 == true {
                    break
                }
            }
        }
        
        return result
    }
}

// MARK: - Tests

/*
 func testPrinter_case1() {
     let printer = Printer()
     XCTAssertEqual(1, printer.solution([2, 1, 3, 2], 2))
 }
 
 func testPrinter_case2() {
     let printer = Printer()
     XCTAssertEqual(5, printer.solution([1, 1, 9, 1, 1, 1], 0))
 }
 */
