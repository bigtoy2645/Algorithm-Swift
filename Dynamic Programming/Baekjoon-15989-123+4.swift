//
//  15989-123+4.swift
//  baekjoon
//
//  Created by yurim on 2021/04/09.
//
// DP) 1,2,3 더하기 4
/*
 정수 4를 1, 2, 3의 합으로 나타내는 방법은 총 4가지가 있다. 합을 나타낼 때는 수를 1개 이상 사용해야 한다. 합을 이루고 있는 수의 순서만 다른 것은 같은 것으로 친다.
 1+1+1+1
 2+1+1 (1+1+2, 1+2+1)
 2+2
 1+3 (3+1)
 정수 n이 주어졌을 때, n을 1, 2, 3의 합으로 나타내는 방법의 수를 구하는 프로그램을 작성하시오.
 첫째 줄에 테스트 케이스의 개수 T가 주어진다. 각 테스트 케이스는 한 줄로 이루어져 있고, 정수 n이 주어진다. n은 양수이며 10,000보다 작거나 같다.
 
 예시)
 3
 4
 7
 10
 ->
 4
 8
 14
 */

func sum4() {
    let count = Int(readLine()!)!
    var nums = Array(repeating: 0, count: count)
    var dp = Array(repeating: Array(repeating: 0, count: 4), count: 10001)
    dp[0][1] = 1
    
    for i in 0..<count {
        nums[i] = Int(readLine()!)!
    }
    let max = nums.max() ?? 1
    
    for i in 1...max {
        dp[i][1] = dp[i-1][1]
        if i > 1 {
            dp[i][2] = dp[i-2][1] + dp[i-2][2]
        }
        if i > 2 {
            dp[i][3] = dp[i-3][1] + dp[i-3][2] + dp[i-3][3]
        }
    }
    
    for n in nums {
        print(dp[n][1] + dp[n][2] + dp[n][3])
    }
}
