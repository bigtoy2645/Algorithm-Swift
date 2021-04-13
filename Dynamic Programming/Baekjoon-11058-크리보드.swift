//
//  11058-크리보드.swift
//  baekjoon
//
//  Created by yurim on 2021/04/12.
//
// DP) 크리보드
/*
 크리보드는 kriii가 만든 신기한 키보드이다. 크리보드에는 버튼이 4개만 있으며, 하는 역할은 다음과 같다.

 화면에 A를 출력한다.
 Ctrl-A: 화면을 전체 선택한다
 Ctrl-C: 전체 선택한 내용을 버퍼에 복사한다
 Ctrl-V: 버퍼가 비어있지 않은 경우에는 화면에 출력된 문자열의 바로 뒤에 버퍼의 내용을 붙여넣는다.
 크리보드의 버튼을 총 N번 눌러서 화면에 출력된 A개수를 최대로하는 프로그램을 작성하시오.
 입력) 첫째 줄에 N(1 ≤ N ≤ 100)이 주어진다.
 출력) 크리보드의 버튼을 총 N번 눌러서 화면에 출력할 수 있는 A 개수의 최댓값을 출력한다.
 
 예시)
 3 -> 3     N = 3인 경우에 A, A, A를 눌러 A 3개를 출력할 수 있다.
 7 -> 9     N = 7인 경우에는 A, A, A, Ctrl-A, Ctrl-C, Ctrl-V, Ctrl-V를 눌러 9개를 출력할 수 있다.
 11 -> 27   N = 11인 경우에는 A, A, A, Ctrl-A, Ctrl-C, Ctrl-V, Ctrl-V, Ctrl-A, Ctrl-C, Ctrl-V, Ctrl-V 를 눌러 27개를 출력할 수 있다.
 */

func kriboard() {
    let n = Int(readLine()!)!
    var nums = Array(repeating: 0, count: 101)
    
    nums[1] = 1
    nums[2] = 2
    nums[3] = 3
    nums[4] = 4
    nums[5] = 5
    
    func press(_ i: Int) -> Int {
        if nums[i] != 0 {
            return nums[i]
        }
        
        var max = press(i-1)+1 // A 1개 추가
        
        // Ctrl-A, Ctrl-C, Ctrl-V
        for j in 3...i-1 {
            let result = press(i-j)*(j-1)
            if result > max { max = result }
        }
        nums[i] = max
        
        return nums[i]
    }
    
    print(press(n))
}
