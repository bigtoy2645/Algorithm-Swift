//
//  GymSuit.swift
//  programmers
//
//  Created by yurim on 2021/02/08.
//  Copyright © 2021 yurim. All rights reserved.
//
// Level1) 체육복
// - 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다.
// - 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return
// - 여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.
//
// 예시
// - n = 5, lost = [2, 4], reserve = [1, 3, 5] -> 5
// - n = 5, lost = [2, 4], reserve = [3] -> 4
// - n = 3, lost = [3], reserve = [1] -> 2

import Foundation

class GymSuit {
    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        
        var reserveArr: [Bool] = Array(repeating: false, count: n+1)

        // 여벌 체육복 true 설정
        for reserveStudent in reserve {
            reserveArr[reserveStudent] = true
        }

        var result = n - lost.count
        for lostStudent in lost.sorted() {
            if reserveArr[lostStudent] == true {                            // 도난 + 여벌
                result += 1
                reserveArr[lostStudent] = false
            } else if reserveArr[lostStudent-1] == true {                   // 앞번호 여벌
                result += 1
                reserveArr[lostStudent-1] = false
            } else if n > lostStudent, reserveArr[lostStudent+1] == true,   // 뒷번호 여벌
                      lost.contains(lostStudent+1) == false {
                result += 1
                reserveArr[lostStudent+1] = false
            }
        }

        return result
    }
}

// MARK: - Tests

/*
 func testGymSuit_case1() {
     let gym = GymSuit()
     XCTAssertEqual(5, gym.solution(5, [4, 2], [1, 3, 5]))
 }
 
 func testGymSuit_case2() {
     let gym = GymSuit()
     XCTAssertEqual(4, gym.solution(5, [2, 4], [3]))
 }
 
 func testGymSuit_case3() {
     let gym = GymSuit()
     XCTAssertEqual(2, gym.solution(3, [3], [1]))
 }
 
 func testGymSuit_case4() {
     let gym = GymSuit()
     XCTAssertEqual(2, gym.solution(3, [1,2], [2,3]))
 }
 */
