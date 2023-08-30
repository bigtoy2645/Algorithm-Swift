//
//  Baekjoon-21275-폰호석만.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/08/30.
//

import Foundation

func phoneHoseokman() {
    let io = FileIO()
    let A = io.readString()
    let B = io.readString()
    var answer = [(Int, Int, Int)]()
    
    for i in 2...36 {
        guard let a = Int(A, radix: i) else { continue } // 10진수로 변환
        for j in 3...36 {
            if i == j { continue }
            guard let b = Int(B, radix: j) else { continue } // 10진수로 변환
            if a == b {
                answer.append((a, i, j))
                if answer.count == 2 { break }
            }
        }
    }
    
    if answer.isEmpty {
        print("Impossible")
    } else if answer.count == 1 {
        print("\(answer[0].0) \(answer[0].1) \(answer[0].2)")
    } else {
        print("Multiple")
    }
}
