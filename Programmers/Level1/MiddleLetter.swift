//
//  MiddleLetter.swift
//  programmers
//
//  Created by yurim on 2020/10/25.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level1) 가운데 글자 가져오기
// - 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환
//
// 예시
// - abcde -> c
// - qwer -> we

import Foundation

class MiddleLetter {
    func solution(_ s:String) -> String {
        let arrString = Array(s)
        let halfCount = s.count / 2
        
        if s.count % 2 == 0 {   // 2글자
            return String(arrString[halfCount-1...halfCount])
        } else {                // 1글자
            return String(arrString[halfCount])
        }
    }
}

// MARK: - Tests

/*
 func testMiddleLetter_case1() {
     let middle = MiddleLetter()
     XCTAssertEqual("c", middle.solution("abcde"))
 }
 
 func testMiddleLetter_case2() {
     let middle = MiddleLetter()
     XCTAssertEqual("we", middle.solution("qwer"))
 }
 */
