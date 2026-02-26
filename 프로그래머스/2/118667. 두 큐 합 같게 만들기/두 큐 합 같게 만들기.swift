import Foundation

// 길이가 같은 두 큐
// 큐1 -> 큐2
// 두 큐의 합을 같도록 하는데, 최소 횟수 (pop + inser = 1회)

// 두 큐의 합을 절반과 일치하도록 
// 불가능할 경우 -1을 리턴

// n: 1~30만개의 원소
// 각 값은 1~10억

// 최솟값을 구하는 문제

// 경우의 수는 2가지의 연속 / 못 만드는 경우도 생각해야함.

// 못만드는 경우
    // 1. 합이 홀 수 인경우
    // 2. 현재 큐와 동일한 경우

// A, B
// A가 크다면 B에서 A로

// 1. 모든 경우의 수 2^30만 > 시간 초과

// i, j > 0 ~ 30만
    // A가 작으면 ++q[i], i++
    // B가 작으면++
struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { return inbox.isEmpty && outbox.isEmpty }
    mutating func enqueue(_ k: T) { inbox.append(k) }
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    let n1 = queue1.count
    let n2 = queue2.count
    
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    
    let queue1 = queue1 + queue2
    let queue2 = queue2 + queue1
    
    var mv = 0
    var i = 0
    var j = 0
    
    while true {
        
        if sum1 == sum2 { 
            break 
        }
        
        if i >= n1 && j >= n2 { 
            return -1 
        }
        
        if sum1 < sum2 {
            sum2 -= queue2[j]
            sum1 += queue2[j]
            j += 1
        
        } else {
            sum1 -= queue1[i]
            sum2 += queue1[i]
            i += 1
        }
        
        mv += 1
    }
    
    return mv
}