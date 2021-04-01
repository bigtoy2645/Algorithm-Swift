//
//  1012-유기농배추.swift
//  baekjoon
//
//  Created by yurim on 2021/04/01.
//
// DFS/BFS) 유기농 배추
/*
 해충 방지에 효과적인 배추흰지렁이를 구입하기로 결심한다.
 특히, 어떤 배추에 배추흰지렁이가 한 마리라도 살고 있으면 이 지렁이는 인접한 다른 배추로 이동할 수 있어, 그 배추들 역시 해충으로부터 보호받을 수 있다.
 (한 배추의 상하좌우 네 방향에 다른 배추가 위치한 경우에 서로 인접해있다고 간주한다)
 배추들이 모여있는 곳에는 배추흰지렁이가 한 마리만 있으면 되므로 서로 인접해있는 배추들이 몇 군데에 퍼져있는지 조사하면 총 몇 마리의 지렁이가 필요한지 알 수 있다.
 예를 들어 배추밭이 아래와 같이 구성되어 있으면 최소 5마리의 배추흰지렁이가 필요하다.
 0은 배추가 심어져 있지 않은 땅이고, 1은 배추가 심어져 있는 땅을 나타낸다.)
 1    1    0    0    0    0    0    0    0    0
 0    1    0    0    0    0    0    0    0    0
 0    0    0    0    1    0    0    0    0    0
 0    0    0    0    1    0    0    0    0    0
 0    0    1    1    0    0    0    1    1    1
 0    0    0    0    1    0    0    1    1    1
 각 테스트 케이스에 대해 필요한 최소의 배추흰지렁이 마리 수를 출력한다.
 
 예시)
 2
 10 8 17
 0 0
 1 0
 1 1
 4 2
 4 3
 4 5
 2 4
 3 4
 7 4
 8 4
 9 4
 7 5
 8 5
 9 5
 7 6
 8 6
 9 6
 10 10 1
 5 5
 ->
 5
 1
 */

func cabbage() {
    let testcase = Int(readLine()!)!
    
    func calculate() -> Int {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        let m = info[0], n = info[1], k = info[2]
        var field = Array(repeating: Array(repeating: 0, count: n), count: m)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var points = [(Int, Int)]()
        var queue = [(Int, Int)]()
        var result = 0
        
        for _ in 0..<k {
            let point = readLine()!.split(separator: " ").map { Int($0)! }
            points.append((point[0], point[1]))
            field[point[0]][point[1]] = 1
        }
        
        for point in points {
            if visited[point.0][point.1] == true { continue }
            visited[point.0][point.1] = true
            queue.append(point)
            var index = (0, 0)
            while queue.count > 0 {
                index = queue.removeFirst()
                for i in [(1,0), (0,1), (-1,0), (0,-1)] {
                    let next = (index.0 + i.0, index.1 + i.1)
                    if (0..<m).contains(next.0), (0..<n).contains(next.1),  // 범위 체크
                       field[next.0][next.1] == 1 && visited[next.0][next.1] == false {
                        visited[next.0][next.1] = true
                        queue.append(next)
                    }
                }
            }
            result += 1
        }
        
        return result
    }
    
    for _ in 0..<testcase {
        print(calculate())
    }
}
