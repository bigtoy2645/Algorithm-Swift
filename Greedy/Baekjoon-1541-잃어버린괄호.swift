//
//  1541-잃어버린괄호.swift
//  baekjoon
//
//  Created by yurim on 2021/05/08.
//
// Greedy) 잃어버린 괄호
/*
 세준이는 양수와 +, -, 그리고 괄호를 가지고 식을 만들었다. 그리고 나서 세준이는 괄호를 모두 지웠다.
 그리고 나서 세준이는 괄호를 적절히 쳐서 이 식의 값을 최소로 만들려고 한다.
 괄호를 적절히 쳐서 이 식의 값을 최소로 만드는 프로그램을 작성하시오.

 첫째 줄에 식이 주어진다. 식은 ‘0’~‘9’, ‘+’, 그리고 ‘-’만으로 이루어져 있고, 가장 처음과 마지막 문자는 숫자이다.
 그리고 연속해서 두 개 이상의 연산자가 나타나지 않고, 5자리보다 많이 연속되는 숫자는 없다. 수는 0으로 시작할 수 있다. 입력으로 주어지는 식의 길이는 50보다 작거나 같다.
 
 예시)
 55-50+40 -> -35
 43-43+45-45 -> -90
 0-101-01 -> -102
 */

func lostbracket() {
    let exps = readLine()!.split(separator: "-").map { String($0) }
    
    func sum(_ exp: String) -> Int {
        let splitexp = exp.split(separator: "+").map { Int(String($0))! }
        return splitexp.reduce(0, +)
    }
    
    var result = sum(exps[0])
    
    for i in 1..<exps.count {
        result -= sum(exps[i])
    }
    
    print(result)
}
