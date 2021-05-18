//
//  1707-이분그래프.swift
//  baekjoon
//
//  Created by yurim on 2021/05/18.
//
/*
 그래프의 정점의 집합을 둘로 분할하여, 각 집합에 속한 정점끼리는 서로 인접하지 않도록 분할할 수 있을 때, 그러한 그래프를 특별히 이분 그래프 (Bipartite Graph) 라 부른다.
 그래프가 입력으로 주어졌을 때, 이 그래프가 이분 그래프인지 아닌지 판별하는 프로그램을 작성하시오.

 입력) 입력은 여러 개의 테스트 케이스로 구성되어 있는데, 첫째 줄에 테스트 케이스의 개수 K(2≤K≤5)가 주어진다.
 각 테스트 케이스의 첫째 줄에는 그래프의 정점의 개수 V(1≤V≤20,000)와 간선의 개수 E(1≤E≤200,000)가 빈 칸을 사이에 두고 순서대로 주어진다.
 각 정점에는 1부터 V까지 차례로 번호가 붙어 있다. 이어서 둘째 줄부터 E개의 줄에 걸쳐 간선에 대한 정보가 주어지는데, 각 줄에 인접한 두 정점의 번호가 빈 칸을 사이에 두고 주어진다.

 출력) K개의 줄에 걸쳐 입력으로 주어진 그래프가 이분 그래프이면 YES, 아니면 NO를 순서대로 출력한다.
 
 예시)
2
3 2
1 3
2 3
4 4
1 2
2 3
3 4
4 2
->
YES
NO
 
1
5 4
1 2
2 3
3 1
4 5
->
NO
 
1
4 4
2 3
1 4
3 4
1 2
->
YES
 */

func bipartiteGraph() {
    let tc = Int(readLine()!)!
    let RED = 1, BLUE = 2
    
    for _ in 0..<tc {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let v = nums[0], e = nums[1]
        var links = Array(repeating: [Int](), count: v+1)
        var visited = Array(repeating: 0, count: v+1)
        
        for _ in 0..<e {
            let link = readLine()!.split(separator: " ").map { Int(String($0))! }
            links[link[0]].append(link[1])
            links[link[1]].append(link[0])
        }
        
        for i in 1...v {
            if visited[i] == 0 {
                var color = RED
                var queue = [Int]()
                var index = 0
                
                visited[i] = color
                queue.append(i)
                while queue.count > index {
                    let pos = queue[index]
                    
                    if visited[pos] == RED {
                        color = BLUE
                    } else if visited[pos] == BLUE {
                        color = RED
                    }
                    
                    // 인접한 노드에 반대 색상 칠하기
                    for next in links[i] {
                        if visited[next] == 0 {
                            visited[next] = color
                            queue.append(next)
                        }
                    }
                    
                    index += 1
                }
            }
        }
        
        // 잘 연결되어 있는지 체크한다.
        var result = true
        for i in 1...v {
            for j in 0..<links[i].count {
                if visited[i] == visited[links[i][j]] {
                    result = false
                    break
                }
            }
            if result == false {
                 break
            }
        }
        
        print(result ? "YES" : "NO")
    }
}

/* 메모리초과
func bipartiteGraph() {
    let tc = Int(readLine()!)!
    
    for _ in 0..<tc {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let v = nums[0], e = nums[1]
        var links = Array(repeating: Array(repeating: 0, count: v+1), count: v+1)
        var colors = Array(repeating: 0, count: v+1)
        var result = true
        
        for _ in 0..<e {
            let link = readLine()!.split(separator: " ").map { Int(String($0))! }
            links[link[0]][link[1]] = 1
            links[link[1]][link[0]] = 1
        }
        
        // 0은 방문전, 1은 빨간색, 2은 파란색으로 칠한다. 첫번째 노드를 빨간색으로 가정한다.
        colors[1] = 1
        
        for node in 1...v {
            for i in 1...v {
                guard node != i, links[node][i] == 1 else { continue }    // 연결된 노드만
                if colors[node] != 0 {              // 색칠되어 있는 경우
                    if colors[node] == colors[i] {  // 인접한 노드와 색상 비교
                        result = false
                        break
                    } else if colors[i] == 0 {      // 인접한 노드에 반대 색상 칠함.
                        colors[i] = colors[node] == 1 ? 2 : 1
                    }
                }
            }
            if result == false { break }
        }
        
        print(result ? "YES" : "NO")
    }
}
 */

/* 틀렸습니다.
 1
 4 4
 2 3
 1 4
 3 4
 1 2
 -> YES가 아니라 NO 출력됨.
 
 let tc = Int(readLine()!)!

 func isbipartite() {
     let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
     let v = nums[0], e = nums[1]
     var links = Array(repeating: [Int](), count: e)
     var nodes = Array(repeating: 0, count: v+1)
     var result = true

     // 0은 방문전, 1은 빨간색, 2은 파란색으로 칠한다고 가정한다.
     nodes[1] = 1

     for i in 0..<e {
         links[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
     }

     for link in links {
         if nodes[link[0]] == 0 {                        // 처음 방문 시 인접한 노드의 반대 색상을 칠한다.
             nodes[link[0]] = (nodes[link[1]] == 1) ? 2 : 1
         } else if nodes[link[0]] == nodes[link[1]] {    // 인접한 노드가 동일한 색상일 경우 이분 그래프가 아니다.
             result = false
             break
         } else if nodes[link[1]] == 0 {                 // 인접한 노드가 방문한 적 없으면 현재 노드의 반대 색상을 칠한다.
             nodes[link[1]] = (nodes[link[0]] == 1) ? 2 : 1
         }
     }

     print(result ? "YES" : "NO")
 }

 for _ in 0..<tc {
     isbipartite()
 }
 */
