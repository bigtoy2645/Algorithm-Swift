//
//  7576-토마토.swift
//  baekjoon
//
//  Created by yurim on 2021/04/04.
//
// DFS/BFS) 토마토
/*
 보관 후 하루가 지나면, 익은 토마토들의 인접한 곳에 있는 익지 않은 토마토들은 익은 토마토의 영향을 받아 익게 된다. 하나의 토마토의 인접한 곳은 왼쪽, 오른쪽, 앞, 뒤 네 방향에 있는 토마토를 의미한다.
 토마토를 창고에 보관하는 격자모양의 상자들의 크기와 익은 토마토들과 익지 않은 토마토들의 정보가 주어졌을 때, 며칠이 지나면 토마토들이 모두 익는지, 그 최소 일수를 구하는 프로그램을 작성하라.
 단, 상자의 일부 칸에는 토마토가 들어있지 않을 수도 있다.
 첫 줄에는 상자의 크기를 나타내는 두 정수 M,N이 주어진다. M은 상자의 가로 칸의 수, N은 상자의 세로 칸의 수를 나타낸다. 단, 2 ≤ M,N ≤ 1,000 이다.
 둘째 줄부터는 하나의 상자에 저장된 토마토들의 정보가 주어진다. 즉, 둘째 줄부터 N개의 줄에는 상자에 담긴 토마토의 정보가 주어진다. 하나의 줄에는 상자 가로줄에 들어있는 토마토의 상태가 M개의 정수로 주어진다.
 정수 1은 익은 토마토, 정수 0은 익지 않은 토마토, 정수 -1은 토마토가 들어있지 않은 칸을 나타낸다.
 여러분은 토마토가 모두 익을 때까지의 최소 날짜를 출력해야 한다. 만약, 저장될 때부터 모든 토마토가 익어있는 상태이면 0을 출력해야 하고, 토마토가 모두 익지는 못하는 상황이면 -1을 출력해야 한다.
 
 예시)
 6 4
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1
 -> 8
 
 6 4
 0 -1 0 0 0 0
 -1 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1
 -> -1
 */

func tomatobox() {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    let m = nums[0], n = nums[1]
    var box = [[Int]]()
    var queue = [(Int, Int)]()
    var tomato = (0,0)
    
    for i in 0..<n {
        let values = readLine()!.split(separator: " ").map { Int($0)! }
        queue.append(contentsOf: values.enumerated().filter({ 1 == $0.element }).map { (i,$0.offset) }) // 값이 1인 indexes
        box.append(values)
    }
    
    var index = 0
    while(queue.count > index) {
        tomato = queue[index]
        
        for (i, j) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
            if (0..<n).contains(tomato.0+i), (0..<m).contains(tomato.1+j),  // 범위 체크
               box[tomato.0+i][tomato.1+j] == 0 {
                queue.append((tomato.0+i, tomato.1+j))
                box[tomato.0+i][tomato.1+j] = box[tomato.0][tomato.1] + 1
            }
        }
        index += 1
    }
    
    let flatvisited = box.flatMap { $0 }
    let maxValue = flatvisited.max() ?? 1
    
    if flatvisited.contains(0) {
        print("-1")
    } else if maxValue == 1 {
        print("0")
    } else {
        print(maxValue-1)
    }
}
