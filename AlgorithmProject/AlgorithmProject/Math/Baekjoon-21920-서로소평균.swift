//
//  Baekjoon-21920-서로소평균.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/08/30.
//

import Foundation

func coprimeAverage() {
    let io = FileIO()
    let N = io.readInt()
    var array = Array(repeating: 0, count: N)
    for i in 0..<N {
        array[i] = io.readInt()
    }
    let X = io.readInt()
    var count: Double = 0
    var sum: Double = 0
    
    for num in array {
        // 유클리드 호제법으로 MOD를 반복하여 0이되면 최대공약수를 구할 수 있다.
        var a = num >= X ? num : X
        var b = num >= X ? X : num
        var tmp = 0
        while (b != 0) {      // b가 0이 될 때까지
            tmp = a % b
            a = b
            b = tmp
        }
        if a == 1 {
            count += 1
            sum += Double(num)
        }
    }
    print("\(sum / count)")
}
