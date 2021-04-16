//
//  lesson7-Brackets.swift
//  codility
//
//  Created by yurim on 2021/04/16.
//
/*
 A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:

 S is empty;
 S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, the string "{[()()]}" is properly nested but "([)()]" is not.

 Write a function:

 public func solution(_ S : inout String) -> Int

 that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.

 For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..200,000];
 string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".

 예시)
 {[()()]} -> 1
 ([)()] -> 0
 
 results : 20m / 100%
 왼쪽 괄호는 큐에 넣고, 오른쪽 괄호를 만나면 큐의 마지막 요소 확인
 */

import Foundation
//import Glibc

public func solution(_ S : inout String) -> Int {
    if S.isEmpty == true { return 1 }
    
    let brackets = Array(S)
    var queue = [String.Element]()
    var result = 1
    
    for b in brackets {
        if b == "{" || b == "[" || b == "(" {
            queue.append(b)
        } else if b == "}" {
            if "{" != queue.popLast() {
                result = 0
                break
            }
        } else if b == "]" {
            if "[" != queue.popLast() {
                result = 0
                break
            }
        } else if b == ")" {
            if "(" != queue.popLast() {
                result = 0
                break
            }
        }
    }
    
    if queue.count != 0 { result = 0 }
    return result
}
