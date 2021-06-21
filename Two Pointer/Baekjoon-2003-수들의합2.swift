//
//  Baekjoon-2003-수들의합2.swift
//  AlgorithmProject
//
//  Created by yurim on 2021/06/21.
//
/* 투포인터) 수들의 합 2
 N개의 수로 된 수열 A[1], A[2], …, A[N] 이 있다. 이 수열의 i번째 수부터 j번째 수까지의 합 A[i] + A[i+1] + … + A[j-1] + A[j]가 M이 되는 경우의 수를 구하는 프로그램을 작성하시오.

 입력) 첫째 줄에 N(1 ≤ N ≤ 10,000), M(1 ≤ M ≤ 300,000,000)이 주어진다. 다음 줄에는 A[1], A[2], …, A[N]이 공백으로 분리되어 주어진다. 각각의 A[x]는 30,000을 넘지 않는 자연수이다.

 출력) 첫째 줄에 경우의 수를 출력한다.
 
 예시)
4 2
1 1 1 1
-> 3
 
 
 */

func sumOfNumbers2() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0], M = input[1]
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    var start = 0, end = 0
    var sum = 0, count = 0
    
    while true {
        if sum >= M {
            sum -= nums[start]
            start += 1
        } else if end == N {    // 더해야하는데 end를 움직일 수 없으면 break
            break
        } else {
            sum += nums[end]
            end += 1
        }
        if sum == M { count += 1}
    }
    
    print(count)
}
