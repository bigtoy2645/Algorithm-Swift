//
//  RemoveNumbers.swift
//  programmers
//
//  Created by bigtoy2645 on 2020/10/10.
//  Copyright © 2020 bigtoy2645. All rights reserved.
//
// Level2) 가장 큰 수 만들기
// - 어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 문자열로 return
//
// 예시
// - 1924, 2 -> 94
// - 1231234, 3 -> 3234
// - 4177252841, 4 -> 775841
// - 9999, 2 -> 99

import Foundation

class RemoveNumbers {
    func solution(_ number:String, _ k:Int) -> String {
        let arrNumber = Array(number)
        var maxNumber = ""
        var startIndex = 0
        var endIndex = k
        var maxValue: String.Element
        var valueIndex: Int
        let length = number.count - k

        while true {
            if startIndex == endIndex {
                maxNumber.append(contentsOf: arrNumber[startIndex...])
                break
            }
            maxValue = arrNumber[startIndex]
            valueIndex = startIndex
            if maxValue != "9" {
                for index in startIndex...endIndex {
                    if arrNumber[index] > maxValue {
                        maxValue = arrNumber[index]
                        valueIndex = index
                        if maxValue == "9" { break }
                    }
                }
            }
            maxNumber.append(maxValue)
            if maxNumber.count == length { break }
            startIndex = valueIndex + 1
            endIndex += 1
        }

        return maxNumber
    }
    
    // 3차 답안 : 10 실패
//    func solution(_ number:String, _ k:Int) -> String {
//        let arrNumber = Array(number)
//        var maxNumber = ""
//        var startIndex = 0
//        var endIndex = k
//        var maxValue: String.Element
//        var valueIndex: Int
//        let length = number.count - k
//
//        while maxNumber.count != length {
//            if startIndex == endIndex {
//                maxNumber.append(contentsOf: arrNumber[startIndex...])
//                break
//            }
//            maxValue = arrNumber[startIndex]
//            valueIndex = startIndex
//            for index in startIndex...endIndex {
//                if arrNumber[index] > maxValue {
//                    maxValue = arrNumber[index]
//                    valueIndex = index
//                }
//            }
//            maxNumber.append(maxValue)
//            startIndex = valueIndex + 1
//            endIndex += 1
//        }
//
//        return maxNumber
//    }
    
    // 2차 답안 : 7~10 실패
//    func solution(_ number:String, _ k:Int) -> String {
//        var maxNumber = ""
//        let maxCount = number.count - k
//        var nextNumber = number
//
//        for _ in 0..<maxCount {
//            let endIndex = nextNumber.index(nextNumber.endIndex, offsetBy: maxNumber.count - maxCount)
//            guard let maxValue = nextNumber[nextNumber.startIndex...endIndex].max() else { break }
//
//            maxNumber.append(maxValue)
//            nextNumber.removeSubrange(nextNumber.startIndex...nextNumber.firstIndex(of: maxValue)!)
//        }
//
//        return maxNumber
//    }
    
    // 1차 답안 : 대부분 실패
//    func solution(_ number:String, _ k:Int) -> String {
//        var removedNumbers: [String] = []
//        let maxIndex = number.count - k
//
//        // 재귀 함수
//        func removeString(number: String, startIndex: Int) {
//            for index in startIndex...maxIndex {
//                var newNumber = number
//                newNumber.remove(at: newNumber.index(newNumber.startIndex, offsetBy: index))
//                if newNumber.count == maxIndex {
//                    removedNumbers.append(newNumber)
//                }
//                else {
//                    removeString(number: newNumber, startIndex: index)
//                }
//            }
//        }
//
//        removeString(number: number, startIndex: 0)
//        return removedNumbers.max() ?? ""
//    }
}

// MARK: - Tests

/*
 func testRemoveNumbers_case1() {
     let removeNumbers = RemoveNumbers()
     XCTAssertEqual("94", removeNumbers.solution("1924", 2))
 }
 
 func testRemoveNumbers_case2() {
     let removeNumbers = RemoveNumbers()
     XCTAssertEqual("3234", removeNumbers.solution("1231234", 3))
 }
 
 func testRemoveNumbers_case3() {
     let removeNumbers = RemoveNumbers()
     XCTAssertEqual("775841", removeNumbers.solution("4177252841", 4))
 }
 */
