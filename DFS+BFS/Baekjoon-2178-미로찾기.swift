//
//  2178-미로찾기.swift
//  baekjoon
//
//  Created by yurim on 2021/03/29.
//
// DFS/BFS) 미로 찾기
/*
 미로에서 1은 이동할 수 있는 칸을 나타내고, 0은 이동할 수 없는 칸을 나타낸다. 이러한 미로가 주어졌을 때,
 (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수를 구하는 프로그램을 작성하시오.
 한 칸에서 다른 칸으로 이동할 때, 서로 인접한 칸으로만 이동할 수 있다. 칸을 셀 때에는 시작 위치와 도착 위치도 포함한다.
 
 예시)
 4 6
 101111
 101010
 101011
 111011
 -> 15
 
 4 6
 110110
 110110
 111111
 111101
 -> 9
 
 2 25
 1011101110111011101110111
 1110111011101110111011101
 -> 38
 
 7 7
 1011111
 1110001
 1000001
 1000001
 1000001
 1000001
 1111111
 -> 13
 */

// BFS로 풀이해야 정답
func findmaze() {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var maze = Array(repeating: Array(repeating: 0, count: nums[1]), count: nums[0])
    var visited = Array(repeating: Array(repeating: 0, count: nums[1]), count: nums[0])
    var queue = [(Int, Int)]()

    for index in 0..<nums[0] {
        maze[index] = readLine()!.map { $0.hexDigitValue! }
    }
    
    var index = (0, 0)
    visited[0][0] = 1
    queue.append((0, 0))
    
    while(queue.count > 0) {
        index = queue.removeFirst()
        
        for (i, j) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
            if (0..<nums[0]).contains(index.0+i), (0..<nums[1]).contains(index.1+j), // 범위 체크
               maze[index.0+i][index.1+j] == 1, visited[index.0+i][index.1+j] == 0 {
                queue.append((index.0+i, index.1+j))
                visited[index.0+i][index.1+j] = visited[index.0][index.1] + 1
            }
        }
    }
    
    print(visited[nums[0]-1][nums[1]-1])
}

/* 시간 초과
func findmaze() {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var maze = Array(repeating: Array(repeating: 0, count: nums[1]), count: nums[0])
    var results = [Int]()

    for index in 0..<nums[0] {
        maze[index] = readLine()!.map { $0.hexDigitValue! }
    }

    func dfs(row: Int, column: Int, count: Int) {
        if row == nums[0]-1 && column == nums[1]-1 {
            results.append(count)
        }
        else if maze[row][column] != 0 {
            maze[row][column] = 0
            if column+1 < nums[1], maze[row][column+1] == 1 {
                dfs(row: row, column: column+1, count: count+1)
            }
            if row+1 < nums[0], maze[row+1][column] == 1 {
                dfs(row: row+1, column: column, count: count+1)
            }
            if row > 0, maze[row-1][column] == 1 {
                dfs(row: row-1, column: column, count: count+1)
            }
            if column > 0, maze[row][column-1] == 1 {
                dfs(row: row, column: column-1, count: count+1)
            }
            maze[row][column] = 1
        }
    }

    dfs(row: 0, column: 0, count: 1)

    print(results.min() ?? 1)
}
*/
