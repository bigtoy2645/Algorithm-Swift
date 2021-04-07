//
//  1890-점프.swift
//  baekjoon
//
//  Created by yurim on 2021/04/07.
//
// DP) 점프
/*
 N×N 게임판에 수가 적혀져 있다. 이 게임의 목표는 가장 왼쪽 위 칸에서 가장 오른쪽 아래 칸으로 규칙에 맞게 점프를 해서 가는 것이다.
 각 칸에 적혀있는 수는 현재 칸에서 갈 수 있는 거리를 의미한다. 반드시 오른쪽이나 아래쪽으로만 이동해야 한다. 0은 더 이상 진행을 막는 종착점이며, 항상 현재 칸에 적혀있는 수만큼 오른쪽이나 아래로 가야 한다. 한 번 점프를 할 때, 방향을 바꾸면 안 된다. 즉, 한 칸에서 오른쪽으로 점프를 하거나, 아래로 점프를 하는 두 경우만 존재한다.
 가장 왼쪽 위 칸에서 가장 오른쪽 아래 칸으로 규칙에 맞게 이동할 수 있는 경로의 개수를 구하는 프로그램을 작성하시오.
 첫째 줄에 게임 판의 크기 N (4 ≤ N ≤ 100)이 주어진다. 그 다음 N개 줄에는 각 칸에 적혀져 있는 수가 N개씩 주어진다. 칸에 적혀있는 수는 0보다 크거나 같고, 9보다 작거나 같은 정수이며, 가장 오른쪽 아래 칸에는 항상 0이 주어진다.
 가장 왼쪽 위 칸에서 가장 오른쪽 아래 칸으로 문제의 규칙에 맞게 갈 수 있는 경로의 개수를 출력한다. 경로의 개수는 263-1보다 작거나 같다.
 
 예시)
 4
 2 3 3 1
 1 2 1 3
 1 2 3 1
 3 1 1 0
 -> 3
 
 3
 1 1 1
 1 1 1
 1 1 1
 -> 6
 */

func jumping() {
    let n = Int(readLine()!)!
    var visited = Array(repeating: Array(repeating: Int64(0), count: n), count: n)
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for index in 0..<n {
        board[index] = readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    
    func move(i: Int, j: Int) -> Int64 {
        if n-1 == i, n-1 == j { // 종착점
            return 1
        }
        let jump = board[i][j]
        if jump != 0, visited[i][j] == 0 {
            if n > i+jump {
                visited[i][j] += move(i: i+jump, j: j)
            }
            if n > j+jump {
                visited[i][j] += move(i: i, j: j+jump)
            }
        }
        return visited[i][j]
    }
    
    print(move(i: 0, j: 0))
}


/* 메모리 초과
func jumping() {
    let n = Int(readLine()!)!
    var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for index in 0..<n {
        board[index] = readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    
    var queue = [(0,0)]
    var index = 0
    var pos = (0,0)
    
    while(queue.count > index) {
        pos = queue[index]
        let jump = board[pos.0][pos.1]
        if jump != 0 {
            if n > pos.0 + jump {
                queue.append((pos.0 + jump, pos.1))
                visited[pos.0 + jump][pos.1] += 1
            }
            if n > pos.1 + jump {
                queue.append((pos.0, pos.1 + jump))
                visited[pos.0][pos.1 + jump] += 1
            }
        }
        index += 1
    }
    
    print(visited[n-1][n-1])
}
*/
