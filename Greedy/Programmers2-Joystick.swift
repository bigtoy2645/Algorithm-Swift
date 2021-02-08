//
//  Joystick.swift
//  programmers
//
//  Created by yurim on 2021/01/23.
//  Copyright © 2021 yurim. All rights reserved.
//
// Level2)
// 조이스틱으로 알파벳 이름을 완성하세요. 맨 처음엔 A로만 이루어져 있습니다.
// "AAA" -> "JAZ"
// - 첫 번째 위치에서 조이스틱을 위로 9번 조작하여 J를 완성합니다.
// - 조이스틱을 왼쪽으로 1번 조작하여 커서를 마지막 문자 위치로 이동시킵니다.
// - 마지막 위치에서 조이스틱을 아래로 1번 조작하여 Z를 완성합니다.
// - 따라서 11번 이동시켜 "JAZ"를 만들 수 있고, 이때가 최소 이동입니다.
//
// 예시
// - JEROEN -> 56
// - JAN -> 23

import Foundation

class Joystick {
    
    func solution(_ name:String) -> Int {
        
        // 정답이지만 실제 몇몇 테스트케이스를 통과하지 못함.
        var utfname: [(Int, Bool)] = name.map( {(Int(($0.utf16.first ?? 65) - 65), false) })
        var cursor = 0
        var result = 0

        while true {
            utfname[cursor].1 = true
            // 알파벳 변경 계산 (▲, ▼)
            result += min(utfname[cursor].0, abs(26 - utfname[cursor].0))

            if utfname.filter({ $0.0 != 0 && $0.1 == false }).count == 0 { break }

            // 다음 제일 가까운 알파벳 찾기 (◀, ▶)
            var moveCount = utfname.count
            var closedIndex = 0
            for index in 0..<utfname.count {
                if utfname[index].0 == 0 { continue }
                if utfname[index].1 == true { continue }
                let count = min(abs(cursor - index), abs(cursor - index + utfname.count))
                if moveCount > count {
                    moveCount = count
                    closedIndex = index
                }
            }
            cursor = closedIndex
            result += moveCount
        }

        return result
        
        // 4, 7 실패 / 실제 테스트케이스 모두 통과함.
//        let utfname: [Int] = name.map( { Int($0.utf16.first ?? 65) - 65 })
//        var result = 0
//
//        // 알파벳 변경 계산 (▲, ▼)
//        for index in 0..<utfname.count {
//            var diff = utfname[index]
//            if diff > 13 {
//                diff = 26 - diff
//            }
//            result += diff
//        }
//
//        if utfname.contains(0) == false {
//            return result + utfname.count - 1
//        }
//
//
//        // 이동거리 계산 (◀, ▶)
//        var a_first = 0, a_last = 0, a_max = 0
//        var count = 0, move = 0
//
//        // 연속된 A 구간 찾기
//        for index in 0..<utfname.count {
//            if utfname[index] == 0 {
//                count += 1
//                if count >= a_max {
//                    a_max = count
//                    a_last = index
//                }
//            } else {
//                if count >= a_max {
//                    a_max = count
//                }
//                count = 0
//            }
//        }
//        a_first = a_last - a_max + 1
//
//        let leftCount = (0..<a_first).count
//        let rightCount = (a_last+1..<utfname.count).count
//
//        // A 구간 : 처음, 중간, 끝
//        // 처음 : 전체개수 - 연속된 A 개수
//        // 중간 : 왼 < 오 : (왼 - 1) * 2 + 오
//        //       왼 > 오 : 오 * 2 + 왼 - 1
//        // 끝 : 전체개수 - 연속된 A 개수 - 1
//        if leftCount == 0 {                     // A 구간 처음 : 뒤로 가서(+1) 셈
//            move = utfname.count - a_max
//        } else if rightCount == 0 {             // A 구간 끝 : 앞에서 부터 셈
//            move = utfname.count - a_max - 1
//        } else {                                // A 구간 중간
//            move = min((leftCount - 1) * 2 + rightCount,
//                       utfname.count - 1,
//                       rightCount * 2 + leftCount - 1)
//        }
//
//        result += move
//
//        return result
        
        
        // MARK: - 4, 5, 7, 11 실패
        
        //        let utfname: [Int] = name.map( { Int($0.utf16.first ?? 65) - 65 })
        //        var result = 0
        //
        //        // 이동거리 계산 (◀, ▶)
        //        var a_first = 0, a_last = 0, a_max = 0
        //        var count = 0
        //
        //        for index in 0..<utfname.count {
        //            if utfname[index] == 0 {
        //                count += 1
        //                if count >= a_max {
        //                    a_max = count
        //                }
        //                a_last = index
        //            } else {
        //                count = 0
        //            }
        //        }
        //
        //        a_first = a_last - a_max + 1
        //
        //        let leftCount = (0..<a_first).count
        //        let rightCount = (a_last+1..<utfname.count).count
        //
        //        // A 구간 : 처음, 중간, 끝
        //        // 처음 : 전체개수 - 연속된 A 개수
        //        // 중간 : 왼 < 오 : (왼 - 1) * 2 + 오
        //        //       왼 > 오 : 오 * 2 + 왼 - 1
        //        // 끝 : 전체개수 - 연속된 A 개수 - 1
        //        if a_first == 0 {
        //            result = utfname.count - a_max
        //        } else if a_last == utfname.count - 1 {
        //            result = utfname.count - a_max - 1
        //        } else {
        //            if leftCount < rightCount {
        //                result = (leftCount - 1) * 2 + rightCount
        //            } else if leftCount > rightCount {
        //                result = rightCount * 2 + leftCount - 1
        //            }
        //        }
        //
        //        // 알파벳 변경 계산 (▲, ▼)
        //        for index in 0..<utfname.count {
        //            var diff = utfname[index]
        //            if diff > 13 {
        //                diff = 26 - diff
        //            }
        //            result += diff
        //        }
        //
        //        return result
        //    }
        
        // MARK: - 5, 11 실패
        
//        let utfname: [Int] = name.map( { Int($0.utf16.first ?? 65) - 65 })
//        var result = name.count - 1
//
//        if utfname.filter({ $0 == 0 }).count == name.count {
//            return 0
//        }
//
//        // 이동거리 계산 (◀, ▶)
//        // 최대는 name.count - 1
//        var a_counts: [Int] = []
//        var a_count = 0
//        if let firstIndex = utfname.firstIndex(of: 0), let lastIndex = utfname.lastIndex(of: 0) {
//            for index in firstIndex...lastIndex {
//                if utfname[index] == 0 {
//                    a_count += 1
//                    if index == lastIndex {
//                        a_counts.append(a_count)
//                    }
//                } else {
//                    a_counts.append(a_count)
//                    a_count = 0
//                }
//            }
//            result -= a_counts.max() ?? 0
//        }
//
//        // 알파벳 변경 계산 (▲, ▼)
//        for index in 0..<utfname.count {
//            var diff = utfname[index]
//            if diff > 13 {
//                diff = 26 - diff
//            }
//            result += diff
//        }
//
//        return result
    }
    
}

// MARK: - Tests

/*
 func testJoystick_case1() {
     let joystick = Joystick()
     XCTAssertEqual(6, joystick.solution("BBABA"))
 }
 
 // 정답이 틀렸다는 예제
 func testJoystick_case2() {
     let joystick = Joystick()
     XCTAssertEqual(8, joystick.solution("BBBAAB"))
 }
 
 func testJoystick_case3() {
     let joystick = Joystick()
     XCTAssertEqual(7, joystick.solution("BBAABAA"))
 }
 
 func testJoystick_case4() {
     let joystick = Joystick()
     XCTAssertEqual(10, joystick.solution("BBAABBB"))
 }
 
 func testJoystick_case5() {
     let joystick = Joystick()
     XCTAssertEqual(7, joystick.solution("BBAABAAAA"))
 }
 
 // 정답이 틀렸다는 예제
 func testJoystick_case6() {
     let joystick = Joystick()
     XCTAssertEqual(10, joystick.solution("BBAABAAAAB"))
 }
 
 func testJoystick_case7() {
     let joystick = Joystick()
     XCTAssertEqual(23, joystick.solution("JAN"))
 }
 */
