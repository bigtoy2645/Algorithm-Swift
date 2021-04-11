//
//  1495-기타리스트.swift
//  baekjoon
//
//  Created by yurim on 2021/04/11.
//
// DP) 기타리스트
/*
 공연이 시작하기 전에 각각의 곡이 시작하기 전에 바꿀 수 있는 볼륨의 리스트를 만들었다. 이 리스트를 V라고 했을 때, V[i]는 i번째 곡을 연주하기 전에 바꿀 수 있는 볼륨을 의미한다.
 항상 리스트에 적힌 차이로만 볼륨을 바꿀 수 있다. 즉, 현재 볼륨이 P이고 지금 i번째 곡을 연주하기 전이라면, i번 곡은 P+V[i]나 P-V[i] 로 연주해야 한다.
 하지만, 0보다 작은 값으로 볼륨을 바꾸거나, M보다 큰 값으로 볼륨을 바꿀 수 없다.
 곡의 개수 N과 시작 볼륨 S, 그리고 M이 주어졌을 때, 마지막 곡을 연주할 수 있는 볼륨 중 최댓값을 구하는 프로그램을 작성하시오. 모든 곡은 리스트에 적힌 순서대로 연주해야 한다.
 첫째 줄에 N, S, M이 주어진다. (1 ≤ N ≤ 100, 1 ≤ M ≤ 1000, 0 ≤ S ≤ M) 둘째 줄에는 각 곡이 시작하기 전에 줄 수 있는 볼륨의 차이가 주어진다. 이 값은 1보다 크거나 같고, M보다 작거나 같다.
 가능한 마지막 곡의 볼륨 중 최댓값을 출력한다. 만약 마지막 곡을 연주할 수 없다면 (중간에 볼륨 조절을 할 수 없다면) -1을 출력한다.
 
 예시)
 3 5 10
 5 3 7
 -> 10
 */

func guitarist() {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nums[0], s = nums[1], m = nums[2]
    let v = readLine()!.split(separator: " ").map { Int(String($0))! }
    var visited = Array(repeating: Array(repeating: false, count: m+1), count: n)
    
    func updown(p: Int, index: Int) -> Int {
        var result = -1
        if index == n { return p }
        
        // 같은 인덱스, 같은 값이 있는지 체크
        if p+v[index] <= m, visited[index][p+v[index]] == false {
            visited[index][p+v[index]] = true
            let up = updown(p: p+v[index], index: index+1)
            result = max(result, up)
        }
        if p-v[index] >= 0, visited[index][p-v[index]] == false {
            visited[index][p-v[index]] = true
            let down = updown(p: p-v[index], index: index+1)
            result = max(result, down)
        }
        return result
    }
    
    print(updown(p: s, index: 0))
}
