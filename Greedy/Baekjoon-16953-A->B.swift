//
//  Baekjoon-16953-A->B.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/09/06.
//

import Foundation

func aToB() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var a = input[0], b = input[1]
    var result = 1
    
    while true {
        if b % 2 == 0 {
            b = b / 2
            result += 1
        } else if (b - 1) % 10 == 0 {
            b = (b - 1) / 10
            result += 1
        } else {
            result = -1
            break
        }
        
        if b == a {
            break
        } else if b < a {
            result = -1
            break
        }
    }
    
    print(result)
}
