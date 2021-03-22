//
//  1065-한수.swift
//  baekjoon
//
//  Created by yurim on 2021/03/22.
//
// Brute Force) 한수
// - 어떤 양의 정수 X의 각 자리가 등차수열을 이룬다면, 그 수를 한수라고 한다. 등차수열은 연속된 두 개의 수의 차이가 일정한 수열을 말한다. N이 주어졌을 때, 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력하는 프로그램을 작성하시오.
//
// 예시
// - 110 -> 99
// - 1 -> 1
// - 210 -> 105
// - 1000 -> 144

import Foundation

func hanNumber() {
    let input: Int = Int(readLine()!) ?? 1
    var result = 0
    
    for i in 1...input {
        if i < 100 {
            result += 1
        } else {
            let num = String(i).map{Int(String($0))!}
            let diff = num[0] - num[1]
            for j in 1..<num.count {
                if j + 1 == num.count {
                    result += 1;
                    break
                }
                if diff != (num[j] - num[j+1]) {
                    break
                }
            }
        }
    }
    
    print(result)
}
