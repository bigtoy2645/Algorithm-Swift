//
//  7568-덩치.swift
//  baekjoon
//
//  Created by yurim on 2021/03/25.
//
// Brute Force) 덩치
/*
 우리는 사람의 덩치를 키와 몸무게, 이 두 개의 값으로 표현하여 그 등수를 매겨보려고 한다. 어떤 사람의 몸무게가 x kg이고 키가 y cm라면 이 사람의 덩치는 (x, y)로 표시된다.
 두 사람 A 와 B의 덩치가 각각 (x, y), (p, q)라고 할 때 x > p 그리고 y > q 이라면 우리는 A의 덩치가 B의 덩치보다 "더 크다"고 말한다.
 예를 들어 어떤 A, B 두 사람의 덩치가 각각 (56, 177), (45, 165) 라고 한다면 A의 덩치가 B보다 큰 셈이 된다. 그런데 서로 다른 덩치끼리 크기를 정할 수 없는 경우도 있다.
 예를 들어 두 사람 C와 D의 덩치가 각각 (45, 181), (55, 173)이라면 몸무게는 D가 C보다 더 무겁고, 키는 C가 더 크므로, "덩치"로만 볼 때 C와 D는 누구도 상대방보다 더 크다고 말할 수 없다.
 N명의 집단에서 각 사람의 덩치 등수는 자신보다 더 "큰 덩치"의 사람의 수로 정해진다. 만일 자신보다 더 큰 덩치의 사람이 k명이라면 그 사람의 덩치 등수는 k+1이 된다.
 이렇게 등수를 결정하면 같은 덩치 등수를 가진 사람은 여러 명도 가능하다.
 A    (55, 185)    2
 B    (58, 183)    2
 C    (88, 186)    1
 D    (60, 175)    2
 E    (46, 155)    5
 
 예시
 5
 55 185
 58 183
 88 186
 60 175
 46 155
 -> 2 2 1 2 5
 */

import Foundation

func weightheight() {
    let count = Int(readLine()!)!
    var people = [[Int]]()
    var result = Array(repeating: 1, count: count)
    
    for _ in 0..<count {
        people.append(readLine()!.split(separator:" ").map { Int($0)! })
    }
    
    for i in 0..<count {
        for j in 0..<count {
            if people[i][0] < people[j][0], people[i][1] < people[j][1] {
                result[i] += 1
            }
        }
    }
    
    print(result.map { String($0) }.joined(separator: " "))
}
