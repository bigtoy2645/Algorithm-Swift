//
//  Baekjoon-1806-부분합.swift
//  AlgorithmProject
//
//  Created by yurim on 2021/06/27.
//
/* 투포인터)
 10,000 이하의 자연수로 이루어진 길이 N짜리 수열이 주어진다. 이 수열에서 연속된 수들의 부분합 중에 그 합이 S 이상이 되는 것 중, 가장 짧은 것의 길이를 구하는 프로그램을 작성하시오.

 입력) 첫째 줄에 N (10 ≤ N < 100,000)과 S (0 < S ≤ 100,000,000)가 주어진다. 둘째 줄에는 수열이 주어진다. 수열의 각 원소는 공백으로 구분되어져 있으며, 10,000이하의 자연수이다.

 출력) 첫째 줄에 구하고자 하는 최소의 길이를 출력한다. 만일 그러한 합을 만드는 것이 불가능하다면 0을 출력하면 된다.
 
 예시)
10 15
5 1 3 5 10 7 4 9 2 8
-> 2

10 100
5 1 3 5 10 7 4 9 2 8
-> 0
 
10 21
11 2 5 6 8 9 2 3 10 9 10
-> 3
 
10 10
1 1 1 1 1 1 1 1 1 10
-> 1
 
10 10
3 3 3 3 3 3 3 3 3 3
-> 4
 */

func sumOfPart() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0], S = input[1]
    let values = readLine()!.split(separator: " ").map { Int(String($0))! }
    var start = 0, end = 0
    var sum = 0, length = Int.max
    
    while start <= end {
        if sum >= S {
            length = min(length, end-start)
            sum -= values[start]
            start += 1
        } else if end == N {
             break
        } else {
            sum += values[end]
            end += 1
        }
    }
    
    if length == Int.max    { print(0) }
    else                    { print(length) }
}

/* 시간초과
func sumOfPart() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0], S = input[1]
    let values = readLine()!.split(separator: " ").map { Int(String($0))! }
    var length = N
    
    for i in 0..<N {
        var sum = 0
        let end = min(N, i+length)
        for j in i..<end {
            sum += values[j]
            if sum >= S {
                length = j - i
                break
            }
        }
        if length == N { break }
    }
    
    if length == N  { print(0) }
    else            { print(length+1) }
}
*/
