//
//  Baekjoon-10866-덱.swift
//  AlgorithmProject
//
//  Created by yurim on 2021/06/07.
//
/* 자료구조) 덱
 정수를 저장하는 덱(Deque)를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오. 명령은 총 여덟 가지이다.

 push_front X: 정수 X를 덱의 앞에 넣는다.
 push_back X: 정수 X를 덱의 뒤에 넣는다.
 pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 
 size: 덱에 들어있는 정수의 개수를 출력한다.
 empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.
 front: 덱의 가장 앞에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 back: 덱의 가장 뒤에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 
 입력) 첫째 줄에 주어지는 명령의 수 N (1 ≤ N ≤ 10,000)이 주어진다. 둘째 줄부터 N개의 줄에는 명령이 하나씩 주어진다. 주어지는 정수는 1보다 크거나 같고, 100,000보다 작거나 같다. 문제에 나와있지 않은 명령이 주어지는 경우는 없다.

 출력) 출력해야하는 명령이 주어질 때마다, 한 줄에 하나씩 출력한다.
 
 예시)
 15
 push_back 1
 push_front 2
 front
 back
 size
 empty
 pop_front
 pop_back
 pop_front
 size
 empty
 pop_back
 push_front 3
 empty
 front
 ->
 2
 1
 2
 0
 2
 1
 -1
 0
 1
 -1
 0
 3
 */

func deque() {
    let N = Int(readLine()!)!
    var myDeque = [Int]()
    
    for _ in 0..<N {
        let command = readLine()!.split(separator: " ").map { String($0) }
        if command[0] == "push_front"       { if let d = Int(command[1]) { myDeque.insert(d, at: 0) } }
        else if command[0] == "push_back"   { if let d = Int(command[1]) { myDeque.append(d) } }
        else if command[0] == "pop_front"   { if myDeque.count == 0 { print("-1") } else { print(myDeque.removeFirst()) } }
        else if command[0] == "pop_back"    { if let n = myDeque.popLast() { print(n) } else { print("-1") } }
        else if command[0] == "size"        { print(myDeque.count) }
        else if command[0] == "empty"       { print(myDeque.isEmpty ? 1 : 0) }
        else if command[0] == "front"       { if myDeque.count == 0 { print("-1") } else { print(myDeque[0]) } }
        else if command[0] == "back"        { if myDeque.count == 0 { print("-1") } else { print(myDeque[myDeque.count-1]) } }
    }
}
