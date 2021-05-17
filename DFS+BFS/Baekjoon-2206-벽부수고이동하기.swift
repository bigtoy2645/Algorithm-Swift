//
//  2206-벽부수고이동하기.swift
//  baekjoon
//
//  Created by yurim on 2021/05/17.
//
/*
 N×M의 행렬로 표현되는 맵이 있다. 맵에서 0은 이동할 수 있는 곳을 나타내고, 1은 이동할 수 없는 벽이 있는 곳을 나타낸다. 당신은 (1, 1)에서 (N, M)의 위치까지 이동하려 하는데,
 이때 최단 경로로 이동하려 한다. 최단경로는 맵에서 가장 적은 개수의 칸을 지나는 경로를 말하는데, 이때 시작하는 칸과 끝나는 칸도 포함해서 센다.
 만약에 이동하는 도중에 한 개의 벽을 부수고 이동하는 것이 좀 더 경로가 짧아진다면, 벽을 한 개 까지 부수고 이동하여도 된다.
 한 칸에서 이동할 수 있는 칸은 상하좌우로 인접한 칸이다.
 맵이 주어졌을 때, 최단 경로를 구해 내는 프로그램을 작성하시오.

 입력) 첫째 줄에 N(1 ≤ N ≤ 1,000), M(1 ≤ M ≤ 1,000)이 주어진다. 다음 N개의 줄에 M개의 숫자로 맵이 주어진다. (1, 1)과 (N, M)은 항상 0이라고 가정하자.

 출력) 첫째 줄에 최단 거리를 출력한다. 불가능할 때는 -1을 출력한다.
 
 예시)
6 4
0100
1110
1000
0000
0111
0000
-> 15

4 4
0111
1111
1111
1110
-> -1
 
5 10
0000011000
1101011010
0000000010
1111111110
1111000000
-> 14
 */

func breakingthewall() {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nums[0], m = nums[1]
    var arr = [[Int]]()
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n)
    var result = -1
    
    for _ in 0..<n {
        arr.append(readLine()!.map{ Int(String($0))! })
    }
    
    var queue = [(Int, Int, Int)]()
    var index = 0
    
    visited[0][0][0] = 1
    queue.append((0,0,0))
    
    while queue.count > index {
        let pos = queue[index]
        
        if pos.0 == n-1, pos.1 == m-1 {
            result = visited[pos.0][pos.1][pos.2]
            break
        }
        
        for (i, j) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
            var next = (pos.0 + i, pos.1 + j, pos.2)
 
            if next.0 >= 0, next.0 < n, next.1 >= 0, next.1 < m,    // 범위 체크
                visited[next.0][next.1][pos.2] == 0 {               // 방문한 적 없을 때
                if arr[next.0][next.1] == 0 {   // 이동 가능
                    visited[next.0][next.1][next.2] = visited[pos.0][pos.1][pos.2] + 1
                    queue.append((next.0, next.1, pos.2))
                } else if next.2 == 0 {         // 벽인데 부수기 가능
                    visited[next.0][next.1][1] = visited[pos.0][pos.1][pos.2] + 1
                    next.2 = 1
                    queue.append(next)
                }
            }
        }
        index += 1
    }
     
    print(result)
}

/* 메모리초과
func breakingthewall() {
    struct Pos {
        var y: Int
        var x: Int
        var breakingWall: Int
    }
    
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nums[0], m = nums[1]
    var arr = [[Int]]()
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n)
    
    for _ in 0..<n {
        arr.append(readLine()!.map{ Int(String($0))! })
    }
     
    func bfs() -> Int {
        var queue = [Pos]()
        visited[0][0][0] = 1
        queue.append(Pos(y: 0, x: 0, breakingWall: 0))
        var index = 0
        
        while queue.count > index {
            let pos = queue[index]
            
            if pos.y == n-1, pos.x == m-1 { return visited[pos.y][pos.x][pos.breakingWall] }
            
            for (i, j) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
                var next = Pos(y: pos.y + i, x: pos.x + j, breakingWall: pos.breakingWall)
     
                if next.y < 0 || next.y >= n || next.x < 0 || next.x >= m {
                    continue
                }
                if visited[next.y][next.x][pos.breakingWall] == 1 {
                    continue
                }
     
                if arr[next.y][next.x] == 0 {
                    visited[next.y][next.x][next.breakingWall] = visited[pos.y][pos.x][pos.breakingWall] + 1
                    queue.append(Pos(y: next.y, x: next.x, breakingWall: pos.breakingWall))
                }
                if arr[next.y][next.x] == 1, next.breakingWall == 0 {
                    visited[next.y][next.x][1] = visited[pos.y][pos.x][pos.breakingWall] + 1
                    next.breakingWall = 1
                    queue.append(next)
                }
            }
            index += 1
        }
        
        queue.removeAll()
     
        return -1
    }
    
    print(bfs())
}
 */

/* 시간초과
func breakingthewall() {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nums[0], m = nums[1]
    var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
    var wall = [(Int, Int)]()
    
    for i in 0..<n {
        arr[i] = readLine()!.map{ Int(String($0))! }
        wall.append(contentsOf: arr[i].enumerated().filter({ 1 == $0.element }).map { (i,$0.offset) })
    }
    
    func mv(visited: [[Int]]) -> Int {
        var visited = visited
        var queue = [(Int,Int)]()
        var index = 0, p = (0,0)
        
        visited[0][0] = 1
        
        queue.append(p)
        while(queue.count > index) {
            p = queue[index]
            
            for (i, j) in [(-1, 0), (0, 1), (1, 0), (0, -1)] {
                let next = (p.0+i, p.1+j)
                if next.0 >= 0, next.0 < n, next.1 >= 0, next.1 < m,    // 범위 체크
                   visited[next.0][next.1] == 0 {
                    queue.append((next.0, next.1))
                    visited[next.0][next.1] = visited[p.0][p.1] + 1
                }
            }
            index += 1
            
//            for k in visited {
//                print(k)
//            }
//            print("-")
        }
        
        return visited[n-1][m-1] == 0 ? -1 : visited[n-1][m-1]
    }
    
    var min = mv(visited: arr)
    
    // 1인 값을 하나씩 0으로 바꾼 뒤 최단 경로를 계산해 본다.
    for (i,j) in wall {
        arr[i][j] = 0
        let result = mv(visited: arr)
        if result != -1, result > min {
            min = result
        }
        arr[i][j] = 1
    }
    print(min)
}
 */
