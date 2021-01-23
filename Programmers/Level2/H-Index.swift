//
//  H-Index.swift
//  programmers
//
//  Created by yurim on 2021/01/23.
//  Copyright © 2021 yurim. All rights reserved.
//
// Level2) H-Index
// 어떤 과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h의 최댓값이 이 과학자의 H-Index입니다.
// 어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.
//
// 예시
// - [3, 0, 6, 1, 5] -> 3
// 이 과학자가 발표한 논문의 수는 5편이고, 그중 3편의 논문은 3회 이상 인용되었습니다. 그리고 나머지 2편의 논문은 3회 이하 인용되었기 때문에 이 과학자의 H-Index는 3입니다.


import Foundation

class HIndex {
    func solution(_ citations:[Int]) -> Int {
        
        var hindexes: [Int] = []
        
        guard let max = citations.max() else {
            return 0
        }
        
        for index in 0...max {
            let hcount = citations.filter { $0 >= index }.count
            let remain = citations.count - hcount
            // print("hIndex = \(index), count = \(hcount) : \(remain)")
            if hcount >= index, index > remain {
                hindexes.append(index)
            }
        }
        
        // print(hindexes)
        
        return hindexes.max() ?? 0
        
        // MARK: - 다른 풀이
//        let citations = citations.sorted() { $0 > $1 }
//            var result = 0
//
//            for i in 0..<citations.count {
//                if i + 1 <= citations[i] {
//                    result = i + 1
//                } else {
//                    break
//                }
//            }
//
//            return result
    }
}

// MARK: - Tests

/*
 func testHIndex_case1() {
     let hindex = HIndex()
     XCTAssertEqual(3, hindex.solution([3, 0, 6, 1, 5]))
 }
 */
