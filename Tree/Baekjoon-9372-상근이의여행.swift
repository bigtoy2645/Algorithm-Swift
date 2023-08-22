//
//  Baekjoon-9372-상근이의여행.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/08/22.
//
/*
 상근이는 겨울방학을 맞아 N개국을 여행하면서 자아를 찾기로 마음먹었다.

 하지만 상근이는 새로운 비행기를 무서워하기 때문에, 최대한 적은 종류의 비행기를 타고 국가들을 이동하려고 한다.

 이번 방학 동안의 비행 스케줄이 주어졌을 때, 상근이가 가장 적은 종류의 비행기를 타고 모든 국가들을 여행할 수 있도록 도와주자.

 상근이가 한 국가에서 다른 국가로 이동할 때 다른 국가를 거쳐 가도(심지어 이미 방문한 국가라도) 된다.
 
 첫 번째 줄에는 테스트 케이스의 수 T(T ≤ 100)가 주어지고,

 각 테스트 케이스마다 다음과 같은 정보가 주어진다.

 첫 번째 줄에는 국가의 수 N(2 ≤ N ≤ 1 000)과 비행기의 종류 M(1 ≤ M ≤ 10 000) 가 주어진다.
 이후 M개의 줄에 a와 b 쌍들이 입력된다. a와 b를 왕복하는 비행기가 있다는 것을 의미한다. (1 ≤ a, b ≤ n; a ≠ b)
 주어지는 비행 스케줄은 항상 연결 그래프를 이룬다.
 */

import Foundation

func sanggenTravel() {
    // 최소 신장 트리 - 크루스칼 알고리즘
    typealias Edge = (a: Int, b: Int, cost: Int)
    
    let io = FileIO()
    let T = io.readInt()    // 테스트 케이스
    var edges: [Edge] = []
    var rank: [Int] = []
    var parent: [Int] = []
    var answer = ""
    
    for _ in 0..<T {
        let N = io.readInt()    // 국가의 수
        let M = io.readInt()    // 비행기 종류
        var count = 0
        
        edges = []
        rank = Array(repeating: 0, count: N+1)
        parent = Array(0...N+1)
        
        for _ in 0..<M {
            let a = io.readInt()
            let b = io.readInt()
            edges.append((a, b, 1))
        }
        
        // sorting할 필요 없음
        // edges.sort { $0.cost < $1.cost }
        
        for edge in edges {
            if findParent(edge.a) != findParent(edge.b) {
                union(edge.a, edge.b)
                count += edge.cost
            }
        }
        
        answer += "\(count)\n"
    }
    
    func findParent(_ node: Int) -> Int {
        if node != parent[node] {
            parent[node] = findParent(parent[node]) // 루트 노드 찾아 재귀 탈출
        }
        return parent[node]
    }
    
    func union(_ lhs: Int, _ rhs: Int) {
        let lRank = findParent(lhs)
        let rRank = findParent(rhs)
        
        if lRank > rRank {
            parent[rRank] = lRank
        } else {
            parent[lRank] = rRank
            if lRank == rRank {
                rank[rRank] += 1
            }
        }
    }
    
    print(answer)
}
