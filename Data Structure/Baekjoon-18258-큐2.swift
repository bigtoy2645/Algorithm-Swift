//
//  Baekjoon-18258-큐2.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/08/07.
//
/* 자료구조) 큐2
 정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.
 
 명령은 총 여섯 가지이다.
 
 push X: 정수 X를 큐에 넣는 연산이다.
 pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 큐에 들어있는 정수의 개수를 출력한다.
 empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
 front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 
 첫째 줄에 주어지는 명령의 수 N (1 ≤ N ≤ 2,000,000)이 주어진다. 둘째 줄부터 N개의 줄에는 명령이 하나씩 주어진다. 주어지는 정수는 1보다 크거나 같고, 100,000보다 작거나 같다. 문제에 나와있지 않은 명령이 주어지는 경우는 없다.
 
 예시)
15
push 1
push 2
front
back
size
empty
pop
pop
pop
size
empty
pop
push 3
empty
front
 ->
1
2
2
0
1
2
-1
0
1
-1
0
3
 */

/* Tip)
 - Swift는 입출력에 많은 시간이 소요되어 readLine() 대신 FileIO 사용
 - removeFirst() 시간복잡도는 O(n)으로 가급적 삭제하지 않는 방법으로 대체
 */

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }
        
        return str
    }
}

func queue2() {
    let fileIO = FileIO()
    let N = fileIO.readInt()
    var myQueue = [Int]()
    var index = 0
    var answer = ""
    
    for _ in 1...N {
        let commands = fileIO.readString()
        
        switch commands {
        // push
        case 448:   myQueue.append(fileIO.readInt())
        // pop
        case 335:   if myQueue.count - index <= 0 { answer += "-1\n" }
                    else {
                        answer += "\(myQueue[index])\n"
                        index += 1
                    }
        // size
        case 443:   answer += "\(myQueue.count - index)\n"
        // empty
        case 559:   answer += "\((myQueue.count - index <= 0) ? 1 : 0)\n"
        // front
        case 553:   if myQueue.count - index <= 0 { answer += "-1\n" } else { answer += "\(myQueue[index])\n" }
        // back
        case 401:   if myQueue.count - index <= 0 { answer += "-1\n" } else { answer += "\(myQueue.last!)\n" }
        default:    break
        }
    }
    
    print(answer)
}
