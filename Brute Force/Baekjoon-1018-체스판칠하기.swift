//
//  1018-체스판칠하기.swift
//  baekjoon
//
//  Created by yurim on 2021/03/25.
//
// Brute Force) 체스 판 칠하기
/*
 지민이는 자신의 저택에서 MN개의 단위 정사각형으로 나누어져 있는 M*N 크기의 보드를 찾았다. 어떤 정사각형은 검은색으로 칠해져 있고, 나머지는 흰색으로 칠해져 있다.
 지민이는 이 보드를 잘라서 8*8 크기의 체스판으로 만들려고 한다.
 체스판은 검은색과 흰색이 번갈아서 칠해져 있어야 한다. 구체적으로, 각 칸이 검은색과 흰색 중 하나로 색칠되어 있고, 변을 공유하는 두 개의 사각형은 다른 색으로 칠해져 있어야 한다.
 따라서 이 정의를 따르면 체스판을 색칠하는 경우는 두 가지뿐이다. 하나는 맨 왼쪽 위 칸이 흰색인 경우, 하나는 검은색인 경우이다.
 보드가 체스판처럼 칠해져 있다는 보장이 없어서, 지민이는 8*8 크기의 체스판으로 잘라낸 후에 몇 개의 정사각형을 다시 칠해야겠다고 생각했다
 당연히 8*8 크기는 아무데서나 골라도 된다. 지민이가 다시 칠해야 하는 정사각형의 최소 개수를 구하는 프로그램을 작성하시오.
 
 예시
 8 8
 WBWBWBWB
 BWBWBWBW
 WBWBWBWB
 BWBBBWBW
 WBWBWBWB
 BWBWBWBW
 WBWBWBWB
 BWBWBWBW
 -> 1
 
 10 13
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 WWWWWWWWWWBWB
 WWWWWWWWWWBWB
 -> 12
 */

func chessboard() {
    let mn = readLine()!.split(separator: " ").map { Int($0)! }
    var board = [[String]]()
    var results = [Int]()
    
    for _ in 0..<mn[0] {
        board.append(readLine()!.unicodeScalars.map(String.init))
    }
    
    for i in 0...mn[0]-8 {
        for j in 0...mn[1]-8 {
            var black = 0   // board[0][0]이 Black로 시작했을 때 칠할 개수
            var white = 0   // board[0][0]이 White로 시작했을 때 칠할 개수
            for k in i..<i+8 {
                for l in j..<j+8 {
                    if (k+l) % 2 == 0 {
                        if board[k][l] == "B" {
                            white += 1
                        } else {
                            black += 1
                        }
                    } else {
                        if board[k][l] == "B" {
                            black += 1
                        } else {
                            white += 1
                        }
                    }
                }
            }
            results.append(min(black, white))
        }
    }
    print(results.min() ?? 0)
}
