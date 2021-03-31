//
//  1697-숨바꼭질.swift
//  baekjoon
//
//  Created by yurim on 2021/03/31.
//
// DFS/BFS) 숨바꼭질
/*
 수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다.
 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 1초 후에 2*X의 위치로 이동하게 된다.
 수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.
 
 예시)
 5 17 -> 4  // 5-10-9-18-17
 6 16 -> 3
 8 20 -> 3
 3 43 -> 6
 4 27 -> 5
 5 35 -> 5
 6 43 -> 5
 7 43 -> 6
 15964 89498 -> 4781
 100 0 -> 100
 */

func hideandseek() {
    let positions = readLine()!.split(separator: " ").map { Int($0)! }
    var n = positions[0], k = positions[1]
    var visited = [Int](repeating: 0, count: max(n,k)*2+1)
    var queue = [(Int)]()
    
    visited[n] = 1
    queue.append(n)
    
    while visited[k] == 0, queue.count > 0 {
        n = queue.removeFirst()
        
        for next in [1, -1, n] {
            if (0..<visited.count).contains(n+next) {
                if visited[n+next] == 0 {
                    visited[n+next] = visited[n] + 1
                    queue.append(n+next)
                } else if visited[n+next] > visited[n] + 1 {
                    visited[n+next] = visited[n] + 1
                    queue.append(n+next)
                }
            }
        }
    }
    
    print(visited[k]-1)
}
