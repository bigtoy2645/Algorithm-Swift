//
//  Baekjoon-32730-두수의합.swift
//  AlgorithmProject
//
//  Created by yurim on 2021/06/24.
//
/* 투포인터) 두 수의 합
 n개의 서로 다른 양의 정수 a1, a2, ..., an으로 이루어진 수열이 있다. ai의 값은 1보다 크거나 같고, 1000000보다 작거나 같은 자연수이다.
 자연수 x가 주어졌을 때, ai + aj = x (1 ≤ i < j ≤ n)을 만족하는 (ai, aj)쌍의 수를 구하는 프로그램을 작성하시오.

 입력) 첫째 줄에 수열의 크기 n이 주어진다. 다음 줄에는 수열에 포함되는 수가 주어진다. 셋째 줄에는 x가 주어진다. (1 ≤ n ≤ 100000, 1 ≤ x ≤ 2000000)

 출력) 문제의 조건을 만족하는 쌍의 개수를 출력한다.
 
 예시)
9
5 12 7 10 9 1 2 3 11
13
->
3
 */

func sumOfTwoNum() {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    let x = Int(readLine()!)!
    var start = 0, end = n-1
    var result = 0
    
    while start < end {
        let sum = nums[start] + nums[end]
        if sum == x {
            start += 1
            end -= 1
            result += 1
        } else if sum < x {
            start += 1
        } else {
            end -= 1
        }
    }
    
    print(result)
}


/* 시간초과
func sumOfTwoNum() {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    let x = Int(readLine()!)!
    var result = 0
    
    for start in 0..<n-1 {
        for end in (start+1..<n).reversed() {
            let sum = nums[start] + nums[end]
            if sum < x {
                break
            } else if sum == x {
                result += 1
                break
            }
        }
    }
    
    print(result)
}
*/
