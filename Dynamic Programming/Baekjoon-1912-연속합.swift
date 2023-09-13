//
//  Baekjoon-1912-연속합.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/09/14.
//

import Foundation

func dpSum() {
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int($0)! }

    for i in 1..<n {
        arr[i] = max(arr[i], arr[i - 1] + arr[i])
    }
    print(arr.max()!)
}
