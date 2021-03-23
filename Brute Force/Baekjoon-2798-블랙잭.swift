//
//  2798-블랙잭.swift
//  baekjoon
//
//  Created by yurim on 2021/03/23.
//
// Brute Force) 블랙잭
/*
 N장의 카드에 써져 있는 숫자가 주어졌을 때, M을 넘지 않으면서 M에 최대한 가까운 카드 3장의 합을 구해 출력

 예시
 5 21
 5 6 7 8 9
 -> 21
 
 10 500
 93 181 245 214 315 36 185 138 216 295
 -> 497
 */

func blackjack() {
    let nums = readLine()!.split(separator:" ").map { Int($0)! }
    let cards = readLine()!.split(separator: " ").map { Int($0)! }
    var max = 0
    
    for i in 0..<nums[0]-2 {
        for j in i+1..<nums[0]-1 {
            for k in j+1..<nums[0] {
                let sum = cards[i] + cards[j] + cards[k]
                if sum > max, sum <= nums[1] {
                    max = sum
                }
            }
        }
    }
    
    print(max)
}
