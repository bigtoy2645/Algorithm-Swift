//
//  10872-팩토리얼.swift
//  baekjoon
//
//  Created by yurim on 2021/05/25.
//
/*
 0보다 크거나 같은 정수 N이 주어진다. 이때, N!을 출력하는 프로그램을 작성하시오.

 입력) 첫째 줄에 정수 N(0 ≤ N ≤ 12)가 주어진다.

 출력) 첫째 줄에 N!을 출력한다.
 
 예시)
 10 -> 3628800
 0 -> 1
 
 */

func factorial() {
    let N = Int(readLine()!)!
    var result = 1
    
    if N >= 2 {
        for n in 2...N {
            result = result * n
        }
    }
    print(result)
}
