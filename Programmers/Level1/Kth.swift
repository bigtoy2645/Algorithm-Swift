//
//  Kth.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/09.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level1) K번째수
// - 배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수 return
//
// 예시
// - [1,5,2,6,3,7,4], [[2,5,3], [4,4,1], [1,7,3]] -> [5,6,3]

import Foundation

class Kth {
    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        return commands.map{ array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1] }
    }
}

// MARK: - Tests

/*
 func testKth_case1() {
     let kth = Kth()
     XCTAssertEqual([5,6,3], kth.solution([1,5,2,6,3,7,4], [[2,5,3], [4,4,1], [1,7,3]]))
 }
 */
