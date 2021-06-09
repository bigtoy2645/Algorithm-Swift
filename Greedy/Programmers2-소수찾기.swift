//
//  Programmers2-소수찾기.swift
//  AlgorithmProject
//
//  Created by yurim on 2021/06/09.
//
/*
 한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.
 각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.

 제한사항)
 numbers는 길이 1 이상 7 이하인 문자열입니다.
 numbers는 0~9까지 숫자만으로 이루어져 있습니다.
 "013"은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.
 
 예시)
 "17" -> 3
 "011" -> 2
 */

import Foundation

class FindPrimeNumber2 {
    func solution(_ numbers:String) -> Int {
        let numbers = numbers.sorted(by: >).map { String($0) }
        let max = Int(numbers.joined()) ?? 0
        
        var arr = [Bool](repeating: true, count: max+1)
        arr[0] = false
        arr[1] = false
        
        // 최대값까지의 소수 모두 구하기
        for divide in 2...Int(max/2) {
            // divide부터 n까지 divide 보폭으로 이동하겠다. divide = 2이면 multiple은 2, 4, 6, ...
            for multiple in stride(from: divide, through: max, by: divide) {
                if arr[multiple] == false { continue }
                if multiple == divide { continue }
                if multiple % divide == 0 { arr[multiple] = false }
            }
        }
        
        var count = 0
        for i in 0..<arr.count {
            if arr[i] == true {
                let splitNumber = String(i).map { String($0) }
                var isMatched = true
                for n in splitNumber {  // numbers에 없거나, numbers에 속한 숫자 개수보다 많으면 조합할 수 없는 소수임.
                    if numbers.contains(n) == false ||
                        numbers.filter({ $0 == n }).count < splitNumber.filter({ $0 == n }).count {
                        isMatched = false
                        break
                    }
                }
                if isMatched {
                    count += 1
                }
            }
        }
        
        return count
    }
}
