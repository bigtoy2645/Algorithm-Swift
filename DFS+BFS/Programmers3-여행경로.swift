//
//  Programmers3-여행경로.swift
//  AlgorithmProject
//
//  Created by yurim on 2021/06/09.
//
/*
 DFS+BFS) 여행 경로
 주어진 항공권을 모두 이용하여 여행경로를 짜려고 합니다. 항상 "ICN" 공항에서 출발합니다.
 항공권 정보가 담긴 2차원 배열 tickets가 매개변수로 주어질 때, 방문하는 공항 경로를 배열에 담아 return 하도록 solution 함수를 작성해주세요.

 제한사항)
 모든 공항은 알파벳 대문자 3글자로 이루어집니다.
 주어진 공항 수는 3개 이상 10,000개 이하입니다.
 tickets의 각 행 [a, b]는 a 공항에서 b 공항으로 가는 항공권이 있다는 의미입니다.
 주어진 항공권은 모두 사용해야 합니다.
 만일 가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 return 합니다.
 모든 도시를 방문할 수 없는 경우는 주어지지 않습니다.
 
 예시)
 [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
 -> ["ICN", "JFK", "HND", "IAD"]
 [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
 -> ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
 [["ICN", "B"], ["B", "ICN"], ["ICN", "A"], ["A", "D"], ["D", "A"]]
 -> ["ICN", "B", "ICN", "A", "D", "A"]
 */

import Foundation

class Triproot {
    
    func solution(_ tickets:[[String]]) -> [String] {
        var visited = Array(repeating: false, count: tickets.count)
        let tickets = tickets.sorted { $0[1] < $1[1] }
        var path = [String]()
            
        func dfs(_ airport: String) {
            if path.count == tickets.count {
                path.append(airport)
                return
            }
            
            for i in 0..<tickets.count {
                let src = tickets[i][0]
                let dst = tickets[i][1]
                
                if airport == src, visited[i] == false {
                    visited[i] = true
                    path.append(src)
                    dfs(dst)
                    // 모든 도시를 방문했으면 종료
                    if path.count == tickets.count + 1 {
                        return
                    }
                    // 해당 경로로 모든 도시를 방문할 수 없다면 취소하고 다른 도시를 방문해 본다.
                    path.removeLast()
                    visited[i] = false
                }
            }
        }
        
        dfs("ICN")
        
        return path
    }
    
    /* 1, 2 시간초과
    func solution(_ tickets:[[String]]) -> [String] {
        var nodes = [String: [String]]()
        var airport = "ICN", root = ["ICN"]
        
        for ticket in tickets {
            if nodes[ticket[0]] != nil {
                nodes[ticket[0]]?.append(ticket[1])
                nodes[ticket[0]]?.sort(by: >)
            } else {
                nodes.updateValue([ticket[1]], forKey: ticket[0])
            }
        }
        
        while tickets.count+1 != root.count {
            if let next = nodes[airport]?.popLast() {   // 다음 경유지가 있으면 이동
                airport = next
                root.append(next)
            }
        }
        
        return root
    }
     */
}
