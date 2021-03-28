//
//  1260-DFS와BFS.swift
//  baekjoon
//
//  Created by yurim on 2021/03/26.
//
// DFS/BFS) DFS와 BFS
/*
 그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성하시오.
 단, 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문하고, 더 이상 방문할 수 있는 점이 없는 경우 종료한다. 정점 번호는 1번부터 N번까지이다.
 
 예시)
 4 5 1
 1 2
 1 3
 1 4
 2 4
 3 4
 ->
 1 2 4 3
 1 2 3 4
 
 5 5 3
 5 4
 5 2
 1 2
 3 4
 3 1
 ->
 3 1 2 5 4
 3 1 4 2 5
 
 1000 1 1000
 999 1000
 ->
 1000 999
 1000 999
 */

func dfsbfs() {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var point = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)
    var visited = [Bool](repeating: false, count: 1001)
    var dfsResult = [Int]()
    var bfsResult = [Int]()
    
    func dfs(index: Int) {
        dfsResult.append(index)
        for i in 1...nums[0] {
            if point[index][i] == 1 && visited[i] == false {    // 인접한 노드
                visited[i] = true
                dfs(index: i)
            }
        }
    }
    
    func bfs(index: Int) {
        var queue = [Int]()
        var index = index
        
        visited[index] = true
        queue.append(index)
        
        while(queue.count > 0) {
            index = queue.removeFirst()
            bfsResult.append(index)
            
            for i in 1...nums[0] {
                if point[index][i] == 1 && visited[i] == false {    // 인접한 노드 큐에 추가
                    visited[i] = true
                    queue.append(i)
                }
            }
        }
    }
    
    for _ in 0..<nums[1] {
        let link = readLine()!.split(separator: " ").map { Int($0)! }
        point[link[0]][link[1]] = 1
        point[link[1]][link[0]] = 1
    }
    
    // DFS
    visited[nums[2]] = true
    dfs(index: nums[2])
    print(dfsResult.map { String($0) }.joined(separator: " "))
    
    // BFS
    visited = [Bool](repeating: false, count: 1001)
    visited[nums[2]] = true
    bfs(index: nums[2])
    print(bfsResult.map { String($0) }.joined(separator: " "))
}

/* 틀렸습니다
 let nums = readLine()!.split(separator: " ").map { Int($0)! }
 var point = Array(repeating: [Int](), count: nums[0]+1)
 
 for _ in 0..<nums[1] {
     let link = readLine()!.split(separator: " ").map { Int($0)! }
     point[link[0]].append(link[1])
     point[link[1]].append(link[0])
 }
 
 var nextdfs = nums[2], nextbfs = nums[2]
 var dfs = [nextdfs], bfs = [nextbfs]
 var resultdfs = [Int](), resultbfs = [Int]()
 
 while dfs.count > 0 && bfs.count > 0 {
     if dfs.count > 0 {
         resultdfs.append(nextdfs)
         dfs.append(contentsOf: point[nextdfs])
         dfs.sort()
         for node in dfs {
             if point[nextdfs].contains(node) == true,   // 인접한 노드
                resultdfs.contains(node) == false {      // 방문 안한 노드
                 nextdfs = node
                 dfs = dfs.filter { $0 != nextdfs }
                 break
             }
         }
     }
     
     if bfs.count > 0 {
         resultbfs.append(nextbfs)
         bfs.append(contentsOf: point[nextbfs].filter { resultbfs.contains($0) == false }.sorted())
         bfs = bfs.filter { $0 != nextbfs }
         if bfs.count > 0 {
             nextbfs = bfs[0]
         }
     }
 }
 
 
 print(resultdfs.map { String($0) }.joined(separator: " "))
 print(resultbfs.map { String($0) }.joined(separator: " "))
 */

/* 시간초과
 let nums = readLine()!.split(separator: " ").map { Int($0)! }
 var point = Array(repeating: [Int](), count: nums[0]+1)

 for _ in 0..<nums[1] {
     let link = readLine()!.split(separator: " ").map { Int($0)! }
     point[link[0]].append(link[1])
     point[link[1]].append(link[0])
 }

 // DFS
 var dfs = [Int]()
 var resultdfs = [Int]()
 var nextPoint = nums[2]
 while true {
     resultdfs.append(nextPoint)
     dfs.append(contentsOf: point[nextPoint].filter { resultdfs.contains($0) == false })
     dfs.sort()
     if dfs.count == 0 {
         break
     }
     for node in dfs {
         if point[nextPoint].contains(node) == true {    // 인접한 노드
             nextPoint = node
             dfs = dfs.filter { $0 != nextPoint }
             break
         }
     }
 }

 // BFS
 var bfs = [Int]()
 var resultbfs = [Int]()
 nextPoint = nums[2]
 while true {
     resultbfs.append(nextPoint)
     bfs.append(contentsOf: point[nextPoint].filter {
                 resultbfs.contains($0) == false &&
                     bfs.contains($0) == false }.sorted())
     if bfs.count == 0 {
         break
     }
     nextPoint = bfs.removeFirst()
 }

 print(resultdfs.map { String($0) }.joined(separator: " "))
 print(resultbfs.map { String($0) }.joined(separator: " "))
 */
