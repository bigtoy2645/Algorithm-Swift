//
//  OpenChat.swift
//  programmers
//
//  Created by yurim on 2020/10/20.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level2) 오픈채팅방
// - 채팅방을 나간 후, 새로운 닉네임으로 다시 들어간다.
// - 채팅방에서 닉네임을 변경한다.
// - 닉네임을 변경할 때는 기존에 채팅방에 출력되어 있던 메시지의 닉네임도 전부 변경된다.
// - 중복 닉네임 허용
//
// 예시
// ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]
// -> ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]

import Foundation

class OpenChat {
    func solution(_ record:[String]) -> [String] {
        var splitRecode: [[String]] = []
        var dicID: [String: String] = [:]
        var result: [String] = []
        
        record.forEach { splitRecode.append($0.components(separatedBy: " ")) }
        
        // 아이디에 해당하는 닉네임 Dictionary 구하기
        for index in 0..<splitRecode.count {
            if splitRecode[index][0] == "Enter" || splitRecode[index][0] == "Change" {
                dicID.updateValue(splitRecode[index][2], forKey: splitRecode[index][1])
            }
        }
        
        for eachRecode in splitRecode {
            guard let nickname = dicID[eachRecode[1]] else { continue }
            if eachRecode[0] == "Enter" {
                result.append("\(nickname)님이 들어왔습니다.")
            } else if eachRecode[0] == "Leave" {
                result.append("\(nickname)님이 나갔습니다.")
            }
        }
        
        return result
    }
}

// MARK: - Tests

/*
 func testOpenChat_case1() {
     let openchat = OpenChat()
     XCTAssertEqual(["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."],
                    openchat.solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
 }
 */
