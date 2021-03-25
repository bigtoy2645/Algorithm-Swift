//
//  1436-영화감독숌.swift
//  baekjoon
//
//  Created by yurim on 2021/03/25.
//
// Brute Force) 영화감독 숌
/*
 종말의 숫자란 어떤 수에 6이 적어도 3개이상 연속으로 들어가는 수를 말한다. 제일 작은 종말의 숫자는 666이고, 그 다음으로 큰 수는 1666, 2666, 3666, .... 과 같다.
 따라서, 숌은 첫 번째 영화의 제목은 세상의 종말 666, 두 번째 영화의 제목은 세상의 종말 1666 이렇게 이름을 지을 것이다.
 일반화해서 생각하면, N번째 영화의 제목은 세상의 종말 (N번째로 작은 종말의 숫자) 와 같다.
 숌이 만든 N번째 영화의 제목에 들어간 숫자를 출력하는 프로그램을 작성하시오. 숌은 이 시리즈를 항상 차례대로 만들고, 다른 영화는 만들지 않는다.
 
 예시
 2 -> 1666
 7 -> 6660
 */

func moviepd() {
    let num = Int(readLine()!)!
    var count = 0
    var result = 665
    
    while count != num {
        result += 1
        var temp = result
        while temp != 0 {   // contains를 쓰면 시간 초과됨
            if temp % 1000 == 666 {
                count += 1
                break
            }
            else { temp /= 10 }
        }
    }
    print(result)
}

