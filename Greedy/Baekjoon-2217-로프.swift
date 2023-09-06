//
//  Baekjoon-2217-로프.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/09/06.
//

import Foundation

func rope() {
    let N = Int(readLine()!)!
    var ropes = Array(repeating: 0, count: N)
    var result = 0
    
    for i in 0..<N {
        ropes[i] = Int(readLine()!)!
    }
    
    ropes.sort(by: <)
    
    for i in 0..<N {
        let weight = ropes[i] * (N - i)
        result = max(weight, result)
    }
    
    print(result)
}
