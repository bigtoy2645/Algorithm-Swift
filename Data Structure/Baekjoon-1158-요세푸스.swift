//
//  Baekjoon-1158-요세푸스.swift
//  AlgorithmProject
//
//  Created by yurim on 2021/06/03.
//
/*
 1번부터 N번까지 N명의 사람이 원을 이루면서 앉아있고, 양의 정수 K(≤ N)가 주어진다. 이제 순서대로 K번째 사람을 제거한다. 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속해 나간다.
 이 과정은 N명의 사람이 모두 제거될 때까지 계속된다. 원에서 사람들이 제거되는 순서를 (N, K)-요세푸스 순열이라고 한다. 예를 들어 (7, 3)-요세푸스 순열은 <3, 6, 2, 7, 5, 1, 4>이다.

 N과 K가 주어지면 (N, K)-요세푸스 순열을 구하는 프로그램을 작성하시오.

 입력) 첫째 줄에 N과 K가 빈 칸을 사이에 두고 순서대로 주어진다. (1 ≤ K ≤ N ≤ 5,000)

 출력) 예제와 같이 요세푸스 순열을 출력한다.
 
 예시) 7 3 -> <3, 6, 2, 7, 5, 1, 4>
 */

func josephus() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0], K = input[1]
    var nums = Array(repeating: false, count: N)
    var count = 0, pos = 0
    var result = [String]()
    
    while result.count < N {
        if nums[pos] == false {
            count += 1
        }
        if count == K {
            nums[pos] = true
            result.append(String(pos+1))
            count = 0
        }
        pos += 1
        if pos == N {
            pos = 0
        }
    }
    print("<\(result.joined(separator: ", "))>")
}
