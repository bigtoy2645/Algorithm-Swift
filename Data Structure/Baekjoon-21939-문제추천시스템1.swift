//
//  Baekjoon-21939-문제추천시스템1.swift
//  AlgorithmProject
//
//  Created by yurim on 2023/08/16.
//
/*
 tony9402는 최근 깃헙에 코딩테스트 대비 문제를 직접 뽑아서 "문제 번호, 난이도"로 정리해놨다.
 
 깃헙을 이용하여 공부하시는 분들을 위해 새로운 기능을 추가해보려고 한다.
 
 만들려고 하는 명령어는 총 3가지가 있다. 아래 표는 각 명령어에 대한 설명이다.
 
 첫 번째 줄에 추천 문제 리스트에 있는 문제의 개수 N 가 주어진다.
 
 두 번째 줄부터 N + 1 줄까지 문제 번호 P와 난이도 L가 공백으로 구분되어 주어진다.
  
 N + 2줄은 입력될 명령문의 개수
 M이 주어진다.
 
 그 다음줄부터 M개의 위에서 설명한 명령문이 입력된다.
 recommend x :
 
 x가 1인 경우 추천 문제 리스트에서 가장 어려운 문제의 번호를 출력한다. 만약 가장 어려운 문제가 여러 개라면 문제 번호가 큰 것으로 출력한다.
  
 x가 -1인 경우 추천 문제 리스트에서 가장 쉬운 문제의 번호를 출력한다. 만약 가장 쉬운 문제가 여러 개라면 문제 번호가 작은 것으로 출력한다.
 
 add P L     추천 문제 리스트에 난이도가 L인 문제 번호 P를 추가한다.
 (추천 문제 리스트에 없는 문제 번호 P만 입력으로 주어진다. 이전에 추천 문제 리스트에 있던 문제 번호가 다른 난이도로 다시 들어 올 수 있다.)
 solved P     추천 문제 리스트에서 문제 번호 P를 제거한다.
 (추천 문제 리스트에 있는 문제 번호 P만 입력으로 주어진다.)
 
 명령어 recommend는 추천 문제 리스트에 문제가 하나 이상 있을 때만 주어진다.
 명령어 solved는 추천 문제 리스트에 문제 번호가 하나 이상 있을 때만 주어진다.
 
 위 명령어들을 수행하는 추천 시스템을 만들어보자.
 recommend 명령이 주어질 때마다 문제 번호를 한 줄씩 출력한다.
 */

import Foundation

// TODO - 다시 풀기

func recommend1() {
    let fileIO = FileIO()
    let N = fileIO.readInt()
    var level = [Int](repeating: 0, count: 100001)
    var hard = [(level: Int, problem: Int)]()
    var easy = [(level: Int, problem: Int)]()
    var answer = ""
    
    for _ in 0 ..< N {
        let p = fileIO.readInt(), l = fileIO.readInt()
        
        pushMaxHeap(l, p)
        pushMinHeap(l, p)
        level[p] = l
    }
    
    let m = fileIO.readInt()
    for _ in 0 ..< m {
        let op = fileIO.readString()
        
        if op == "add" {
            let p = fileIO.readInt()
            let l = fileIO.readInt()
            
            pushMaxHeap(l, p)
            pushMinHeap(l, p)
            level[p] = l
        } else if op == "solved" {
            let p = fileIO.readInt()
            level[p] = 0
        } else {
            let x = fileIO.readInt()
            
            if x == 1 {
                while level[hard[0].1] == 0 || level[hard[0].1] != hard[0].0 {
                    popMaxHeap()
                }
                answer += "\(hard[0].1)\n"
            } else {
                while level[easy[0].1] == 0 || level[easy[0].1] != easy[0].0 {
                    popMinHeap()
                }
                answer += "\(easy[0].1)\n"
            }
        }
    }
    
    print("answer: \(answer)")
    
    func pushMaxHeap(_ L: Int, _ P: Int) {
        hard.append((L, P))
        
        var cur = hard.count - 1
        while cur > 0 && hard[(cur - 1) / 2].0 <= hard[cur].0 {
            if hard[cur].0 == hard[(cur - 1) / 2].0 && hard[cur].1 < hard[(cur - 1) / 2].1 { break }
            
            let temp = hard[(cur - 1) / 2]
            hard[(cur - 1) / 2] = hard[cur]
            hard[cur] = temp
            cur = (cur - 1) / 2
        }
    }
    
    func pushMinHeap(_ L: Int, _ P: Int) {
        easy.append((L, P))
        
        var cur = easy.count - 1
        while cur > 0 && easy[cur].0 <= easy[(cur - 1) / 2].0 {
            if easy[cur].0 == easy[(cur - 1) / 2].0 && easy[(cur - 1) / 2].1 < easy[cur].1 { break }
            
            let temp = easy[(cur - 1) / 2]
            easy[(cur - 1) / 2] = easy[cur]
            easy[cur] = temp
            cur = (cur - 1) / 2
        }
    }
    
    func popMaxHeap() {
        hard.swapAt(0, hard.endIndex - 1)
        _ = hard.popLast()!
        
        var cur = 0, child = 0
        while cur * 2 + 1 < hard.count {
            let left = cur * 2 + 1, right = cur * 2 + 2
            if right == hard.count { child = left }
            else {
                if hard[left].0 == hard[right].0 {
                    child = hard[left].1 > hard[right].1 ? left : right
                } else {
                    child = hard[left].0 > hard[right].0 ? left : right
                }
            }
            
            if hard[cur].0 == hard[child].0 {
                if hard[cur].1 > hard[child].1 { break }
            } else if hard[cur].0 > hard[child].0 { break }
            
            let temp = hard[child]
            hard[child] = hard[cur]
            hard[cur] = temp
            cur = child
        }
    }
    
    func popMinHeap() {
        easy.swapAt(0, easy.endIndex - 1)
        _ = easy.popLast()!
        
        var cur = 0, child = 0
        while cur * 2 + 1 < easy.count {
            let left = cur * 2 + 1, right = cur * 2 + 2
            if right == easy.count { child = left }
            else {
                if easy[left].0 == easy[right].0 {
                    child = easy[left].1 < easy[right].1 ? left : right
                } else {
                    child = easy[left].0 < easy[right].0 ? left : right
                }
            }
            
            if easy[cur].0 == easy[child].0 {
                if easy[cur].1 < easy[child].1 { break }
            } else if easy[cur].0 < easy[child].0 { break }
            
            let temp = easy[child]
            easy[child] = easy[cur]
            easy[cur] = temp
            cur = child
        }
    }
}

