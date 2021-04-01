//
//  2667-단지번호붙이기.swift
//  baekjoon
//
//  Created by yurim on 2021/04/02.
//
// DFS/BFS) 단지번호붙이기
/*
 <그림 1>과 같이 정사각형 모양의 지도가 있다. 1은 집이 있는 곳을, 0은 집이 없는 곳을 나타낸다. 철수는 이 지도를 가지고 연결된 집의 모임인 단지를 정의하고, 단지에 번호를 붙이려 한다.
 여기서 연결되었다는 것은 어떤 집이 좌우, 혹은 아래위로 다른 집이 있는 경우를 말한다. 대각선상에 집이 있는 경우는 연결된 것이 아니다. <그림 2>는 <그림 1>을 단지별로 번호를 붙인 것이다.
 지도를 입력하여 단지수를 출력하고, 각 단지에 속하는 집의 수를 오름차순으로 정렬하여 출력하는 프로그램을 작성하시오.
 첫 번째 줄에는 총 단지수를 출력하시오. 그리고 각 단지내 집의 수를 오름차순으로 정렬하여 한 줄에 하나씩 출력하시오.

 예시)
 7
 0110100
 0110101
 1110101
 0000111
 0100000
 0111110
 0111000
 ->
 3
 7
 8
 9
 */

func housenumber () {
    let m = Int(readLine()!)!
    var field = Array(repeating: [Int](), count: m)
    
    for i in 0..<m {
        field[i] = readLine()!.map { $0.hexDigitValue! }
    }
    
    let n = field[0].count
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    var queue = [(Int, Int)]()
    var results = [Int]()
    
    for i in 0..<m {
        for j in 0..<n {
            if visited[i][j] == true || field[i][j] == 0 { continue }
            visited[i][j] = true
            queue.append((i,j))
            var index = (0, 0)
            var count = 0
            while queue.count > 0 {
                count += 1
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
            results.append(count)
        }
    }
    
    results.sort()
    print(results.count)
    for result in results { print(result) }
}
