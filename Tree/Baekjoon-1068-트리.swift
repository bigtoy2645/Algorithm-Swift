//
//  Baekjoon-1068-트리.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/08/23.
//
/*
 트리에서 리프 노드란, 자식의 개수가 0인 노드를 말한다.
 트리가 주어졌을 때, 노드 하나를 지울 것이다. 그 때, 남은 트리에서 리프 노드의 개수를 구하는 프로그램을 작성하시오. 노드를 지우면 그 노드와 노드의 모든 자손이 트리에서 제거된다.

 이제 리프 노드의 개수는 1개이다.
 
 입력
 첫째 줄에 트리의 노드의 개수 N이 주어진다. N은 50보다 작거나 같은 자연수이다. 둘째 줄에는 0번 노드부터 N-1번 노드까지, 각 노드의 부모가 주어진다. 만약 부모가 없다면 (루트) -1이 주어진다. 셋째 줄에는 지울 노드의 번호가 주어진다.

 출력
 첫째 줄에 입력으로 주어진 트리에서 입력으로 주어진 노드를 지웠을 때, 리프 노드의 개수를 출력한다.
 
5
1 -1 0 1 1
0
 
 2
 */

import Foundation

func tree() {
    class Node {
        var data: Int
        var parent: Node?
        var child: [Node] = []
        
        init(data: Int) {
            self.data = data
        }
    }
    
    let io = FileIO()
    let N = io.readInt()
    let nodes: [Node] = Array(0..<N).map { Node(data: $0) }
    var root: Int = 0
    var answer = 0
    
    for i in 0..<N {
        let parent = io.readInt()
        if parent == -1 {
            root = i
        } else {
            nodes[i].parent = nodes[parent]
            nodes[parent].child.append(Node(data: i))
        }
    }
    
    let removeNode = io.readInt()
    if removeNode != root {
        removeChild(data: removeNode)
        
//        for node in nodes {
//            NSLog("nodes \(node.data) = \(node.child.map { $0.data })")
//        }
        
        if nodes[root].child.isEmpty {
            answer = 1
        } else {
            countLeafNode(root)
        }
    }
    print(answer)

    func countLeafNode(_ data: Int) {
        let node = nodes[data]
//        NSLog("\(node.data) 검색!")
        if node.child.count == 0 {
            answer += 1
//            NSLog("\(node.data)는 리프노드다.")
        } else {
            for child in node.child {
                countLeafNode(child.data)
            }
        }
    }
    
    func removeChild(data: Int) {
        for node in nodes[data].child {
            removeChild(data: node.data)
        }
        nodes[data].parent?.child.removeAll(where: { node in
            node.data == data
        })
        nodes[data].child = []
    }
}
