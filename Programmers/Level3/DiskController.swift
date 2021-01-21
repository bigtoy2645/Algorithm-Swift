//
//  DiskController.swift
//  programmers
//
//  Created by yurim on 2021/01/21.
//  Copyright © 2021 yurim. All rights reserved.
//
// Level3) 디스크 컨트롤러
// 각 작업에 대해 [작업이 요청되는 시점, 작업의 소요시간]을 담은 2차원 배열 jobs가 매개변수로 주어질 때,
// 작업의 요청부터 종료까지 걸린 시간의 평균을 가장 줄이는 방법으로 처리하면 평균이 얼마가 되는지 return
//
// - A: 3ms 시점에 작업 완료(요청에서 종료까지 : 3ms)
// - C: 2ms부터 대기하다가, 3ms 시점에 작업을 시작해서 9ms 시점에 작업 완료(요청에서 종료까지 : 7ms)
// - B: 1ms부터 대기하다가, 9ms 시점에 작업을 시작해서 18ms 시점에 작업 완료(요청에서 종료까지 : 17ms)
// 이렇게 A → C → B의 순서로 처리하면 각 작업의 요청부터 종료까지 걸린 시간의 평균은 9ms(= (3 + 7 + 17) / 3)
//
// 예시
// - [[0, 3], [1, 9], [2, 6]] -> 9
//
// - [[0, 10], [2, 10], [9, 10], [15, 2]] -> 14
// - [[0, 10], [2, 12], [9, 19], [15, 17]] -> 25
// - [[0, 1]] -> 1
// - [[1000, 1000]]) -> 1000

import Foundation

class DiskController {
    func solution(_ jobs:[[Int]]) -> Int {

        // MARK: - 정답 풀이 참조함.
        
        var sortedTasks = jobs.sorted { (first, second) -> Bool in
            if first[1] < second[1] {
                return true
            } else if first[1] == second[1] {
                return first[0] < second[0]
            } else {
                return false
            }
        }
        
        print(sortedTasks)
        
        var time: Int = 0
        var total: Int = 0
        while sortedTasks.count > 0 {
            for index in 0..<sortedTasks.count {
                let task = sortedTasks[index]
                
                // 작업 처리할 시간이 흘렀으면
                if task[0] <= time {
                    time += task[1]
                    total += time - task[0]
                    sortedTasks.remove(at: index)
                    break
                }
                // 먼저 요청된 작업 처리하도록 시간 값 변경
                if index == sortedTasks.count - 1 {
                    time = sortedTasks.map({ $0[0] }).min() ?? time + 1
                }
            }
        }
        
        return Int(total / jobs.count)
        
        // MARK: - 1 ~ 13 failed
        
        //        var workingTime = 0
        //        var tasks = jobs.sorted { $0[1] - $0[0] < $1[1] - $1[0] }[jobs.startIndex...]
        //        var position = tasks.map { $0[0] }.min() ?? 0
        //
        //        while tasks.count > 0 {
        //            let nextPos = tasks.map { $0[0] }.min() ?? position
        //            if nextPos > position {
        //                position = nextPos
        //            }
        //
        //            for index in 0..<tasks.count {
        //                let task = tasks[index]
        //                if position >= task[0] {
        //                    workingTime += position - task[0] + task[1]
        //                    position += task[1]
        //                    tasks.remove(at: index)
        //                    break
        //                }
        //            }
        //        }
        //
        //        return Int(workingTime / jobs.count)
        
        
        // MARK: - 1 ~ 13 failed
        
        //        var workingTime = 0
        //        var tasks = jobs.sorted { $0[0] < $1[0] }[jobs.startIndex...]
        //        var position = tasks[0][0]
        //
        //        while tasks.count > 0 {
        //            let nextPos = tasks.map { $0[0] }.min() ?? position
        //            if nextPos > position {
        //                position = nextPos
        //            }
        //
        //            let nextTasks = tasks.filter { position >= $0[0] }
        //            let minValue = nextTasks.map { $0[1] - $0[0] }.min()
        //
        //            if let task = tasks.popFirst() {
        //                if minValue == task[1] - task[0] {
        //                    workingTime += position - task[0] + task[1]
        //                    position += task[1]
        //                } else {
        //                    tasks.append(task)
        //                }
        //            }
        //        }
        //
        //        let result = floor(Double(workingTime / jobs.count))
        //
        //        return Int(result)
    }
}

// MARK: - Tests

/*
 func testDiskController_case1() {
     let disk = DiskController()
     XCTAssertEqual(14, disk.solution([[0, 10], [2, 10], [9, 10], [15, 2]]))
 }
 
 func testDiskController_case2() {
     let disk = DiskController()
     XCTAssertEqual(25, disk.solution([[0, 10], [2, 12], [9, 19], [15, 17]]))
 }
 
 func testDiskController_case3() {
     let disk = DiskController()
     XCTAssertEqual(9, disk.solution([[0, 3], [1, 9], [2, 6]]))
 }
 
 func testDiskController_case4() {
     let disk = DiskController()
     XCTAssertEqual(1, disk.solution([[0, 1]]))
 }
 
 func testDiskController_case5() {
     let disk = DiskController()
     XCTAssertEqual(1000, disk.solution([[1000, 1000]]))
 }
 
 func testDiskController_case6() {
     let disk = DiskController()
     XCTAssertEqual(2, disk.solution([[0, 1], [0, 1], [0, 1]]))
 }

 func testDiskController_case7() {
     let disk = DiskController()
     XCTAssertEqual(2, disk.solution([[0, 1], [0, 1], [0, 1], [0, 1]]))
 }
 
 func testDiskController_case8() {
     let disk = DiskController()
     XCTAssertEqual(500, disk.solution([[0, 1], [1000, 1000]]))
 }
 
 func testDiskController_case9() {
     let disk = DiskController()
     XCTAssertEqual(550, disk.solution([[100, 100], [1000, 1000]]))
 }
 
 func testDiskController_case10() {
     let disk = DiskController()
     XCTAssertEqual(550, disk.solution([[100, 100], [1000, 1000]]))
 }
 
 func testDiskController_case11() {
     let disk = DiskController()
     XCTAssertEqual(6, disk.solution([[10, 10], [30, 10], [50, 2], [51, 2]]))
 }
 
 func testDiskController_case12() {
     let disk = DiskController()
     XCTAssertEqual(7, disk.solution([[0, 3], [1, 9], [2, 6], [30, 3]]))
 }
 
 func testDiskController_case13() {
     let disk = DiskController()
     XCTAssertEqual(1, disk.solution([[0,1],[0,1],[1,0]]))
 }
 
 func testDiskController_case14() {
     let disk = DiskController()
     XCTAssertEqual(9, disk.solution([[0, 3], [1, 9], [2, 6], [4, 3]]))
 }
 
 func testDiskController_case15() {
     let disk = DiskController()
     XCTAssertEqual(2, disk.solution([[0, 1], [0, 3]]))
 }
 
 func testDiskController_case16() {
     let disk = DiskController()
     XCTAssertEqual(6, disk.solution([[0, 5], [1, 2], [5, 5]]))
 }
 
 func testDiskController_case17() {
     let disk = DiskController()
     XCTAssertEqual(74, disk.solution([[24, 10], [18, 39], [34, 20], [37, 5], [47, 22], [20, 47], [15, 2], [15, 34], [35, 43], [26, 1]]))
 }
 */
