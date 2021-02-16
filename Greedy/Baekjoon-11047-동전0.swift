//
//  11047-동전0.swift
//  baekjoon
//
//  Created by yurim on 2021/02/15.
//
// Greedy) 동전 0
// 준규가 가지고 있는 동전은 총 N종류이고, 각각의 동전을 매우 많이 가지고 있다.
// 동전을 적절히 사용해서 그 가치의 합을 K로 만들려고 한다. 이때 필요한 동전 개수의 최솟값을 구하는 프로그램을 작성하시오.
//
// 예시
/*
 10 4200
 1
 5
 10
 50
 100
 500
 1000
 5000
 10000
 50000
 -> 6
 
 10 4790
 1
 5
 10
 50
 100
 500
 1000
 5000
 10000
 50000
 -> 12
 */

func coin0() {
    let input = readLine()!.split(separator:" ").map({ Int($0)! })
    var remain = input[1]
    var coins = [Int]()
    var result = 0
    
    for _ in 0..<input[0] {
        coins.append(Int(readLine()!)!)
    }
    
    for coin in coins.sorted(by: >) {
        if coin > remain { continue }
        let quotient = remain / coin
        result += quotient
        remain -= quotient * coin
        if remain == 0 { break }
    }
    
    print(result)
}

// MARK: - Tests

func coin0(_ coins: [Int], value: Int) -> Int {
    var remain = value
    var result = 0
    
    for coin in coins.sorted(by: >) {
        if coin > remain { continue }
        let quotient = remain / coin
        result += quotient
        remain -= quotient * coin
        if remain == 0 { break }
    }
    
    return result
}

/*
 func testCoin0_case1() {
     XCTAssertEqual(6, coin0([1, 5, 10, 50, 100, 500, 1000, 5000, 10000, 50000], value: 4200))
 }
 
 func testCoin0_case2() {
     XCTAssertEqual(12, coin0([1, 5, 10, 50, 100, 500, 1000, 5000, 10000, 50000], value: 4790))
 }
 */
