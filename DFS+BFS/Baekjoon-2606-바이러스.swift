//
//  2606-바이러스.swift
//  baekjoon
//
//  Created by yurim on 2021/04/03.
//
// DFS/BFS) 바이러스
/*
 컴퓨터의 수와 네트워크 상에서 서로 연결되어 있는 정보가 주어질 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 출력하는 프로그램을 작성하시오.
 첫째 줄에는 컴퓨터의 수가 주어진다. 컴퓨터의 수는 100 이하이고 각 컴퓨터에는 1번 부터 차례대로 번호가 매겨진다.
 둘째 줄에는 네트워크 상에서 직접 연결되어 있는 컴퓨터 쌍의 수가 주어진다.
 이어서 그 수만큼 한 줄에 한 쌍씩 네트워크 상에서 직접 연결되어 있는 컴퓨터의 번호 쌍이 주어진다.
 1번 컴퓨터가 웜 바이러스에 걸렸을 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 첫째 줄에 출력한다.
 
 예시)
 7
 6
 1 2
 2 3
 1 5
 5 2
 5 6
 4 7
 -> 4
 */

func virus() {
    let com = Int(readLine()!)!
    var point = Array(repeating: Array(repeating: 0, count: com+1), count: com+1)
    var visited = Array(repeating: false, count: com+1)
    var queue = [Int]()
    var node = 0
    var result = -1
    
    for _ in 0..<Int(readLine()!)! {
        let link = readLine()!.split(separator: " ").map { Int($0)! }
        point[link[0]][link[1]] = 1
        point[link[1]][link[0]] = 1
    }
    
    queue.append(1)
    visited[1] = true
    while queue.count > 0 {
        node = queue.removeFirst()
        result += 1
        for i in 1...com {
            if point[node][i] == 1 && visited[i] == false {
                visited[i] = true
                queue.append(i)
            }
        }
    }
    
    print(result)
}
