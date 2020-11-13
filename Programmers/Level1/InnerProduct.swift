//
//  InnerProduct.swift
//  programmers
//
//  Created by yurim on 2020/11/13.
//  Copyright © 2020 yurim. All rights reserved.
//
// Level1) 내적
// - a[0]*b[0] + a[1]*b[1] + ... + a[n-1]*b[n-1] 리턴
//
// 예시
// - a = [1,2,3,4], b = [-3,-1,0,2] -> 3
// - a = [-1,0,1], b = [1,0,-1] -> -2

import Foundation

class InnerProduct {
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        var result: Int = 0
        
        for index in 0..<a.count {
            result += a[index] * b[index]
        }
        
        return result
    }
}

// MARK: - Tests

/*
 func testInnerProduct_case1() {
     let innerProduct = InnerProduct()
     XCTAssertEqual(3, innerProduct.solution([1,2,3,4], [-3,-1,0,2]))
 }
 
 func testInnerProduct_case2() {
     let innerProduct = InnerProduct()
     XCTAssertEqual(-2, innerProduct.solution([-1,0,1], [1,0,-1]))
 }
 */
