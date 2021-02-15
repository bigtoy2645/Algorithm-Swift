//
//  2839-설탕배달.swift
//  baekjoon
//
//  Created by yurim on 2021/02/09.
//
// Greedy) 설탕 배달
// - 상근이는 지금 사탕가게에 설탕을 정확하게 N킬로그램을 배달해야 한다. 설탕공장에서 만드는 설탕은 봉지에 담겨져 있다. 봉지는 3킬로그램 봉지와 5킬로그램 봉지가 있다. 최대한 적은 봉지를 들고 가려고 한다.
// - 예를 들어, 18킬로그램 설탕을 배달해야 할 때, 3킬로그램 봉지 6개를 가져가도 되지만, 5킬로그램 3개와 3킬로그램 1개를 배달하면, 더 적은 개수의 봉지를 배달할 수 있다.
// - 설탕을 정확하게 N킬로그램 배달해야 할 때, 봉지 몇 개를 가져가면 되는지 그 수를 구하는 프로그램을 작성한다. 정확하게 N킬로그램을 만들 수 없다면 -1을 출력한다.
//
// 예시
// - 18 -> 4
// - 4 -> -1
// - 6 -> 2
// - 9 -> 3
// - 11 -> 3
// - 14 -> 4

func sugerDelivery() {
    let allSugar: Int = Int(readLine()!) ?? 0
    var result = -1
    
    if 0 == allSugar % 5 {          // 5kg
        result = allSugar / 5
    } else {                        // 5kg, 3kg
        for index in (0...allSugar / 5).reversed() {
            let remain = allSugar - index * 5
            if 0 == remain % 3 {
                result = index + remain / 3
                break
            }
        }
    }

    print(result)
}

// MARK: - Tests

func sugerDelivery_test(_ allSugar: Int) -> Int {
    var result = -1
    
    if 0 == allSugar % 5 {          // 5kg
        result = allSugar / 5
    } else {                        // 5kg, 3kg
        for index in (0...allSugar / 5).reversed() {
            let remain = allSugar - index * 5
            if 0 == remain % 3 {
                result = index + remain / 3
                break
            }
        }
    }

    return result
}

/*
 func testSugarDelivery_case1() {
     XCTAssertEqual(4, sugerDelivery_test(18))
 }
 
 func testSugarDelivery_case2() {
     XCTAssertEqual(-1, sugerDelivery_test(4))
 }
 
 func testSugarDelivery_case3() {
     XCTAssertEqual(2, sugerDelivery_test(6))
 }
 
 func testSugarDelivery_case4() {
     XCTAssertEqual(3, sugerDelivery_test(9))
 }
 
 func testSugarDelivery_case5() {
     XCTAssertEqual(3, sugerDelivery_test(11))
 }
 */
