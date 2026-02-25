import Foundation

// n명이 대기

// 각 심사 시간은 다르다.

// 처음엔 비어있음
// 한 번에 1명만 심사
// 기다렸다가 갈 수도 있음

// 최소로 시간을 하고 싶음 > 최솟값 문제

// n: 1~10억명
// t: 1~10억분
// 심사는 1~10만명

// 무조건 빈 곳으로 들어가지 않음 > 더 짧은 시간이 있으면 대기

// 1. 무식하게 생각하면
// t 시간동안 각각 쳐낼 수 있는 인원의 합이 n에 도달하는 가장 적은 t

// 근데 for문으로 1 ~ 10억 찾으면 불가능
    // 각 심사자가 t 시간동안 받을 수 있는 인원 연산 > O(10만)
    // t를 이분 탐색으로 찾으면?
        // O(10만 * log 10억)

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    func canPass(for t: Int) -> Int {
        var passed = 0
        for time in times {
            passed += t / time
        }
        return passed
    }   
    
    var st = 0
    var en = 1_000_000_000 * 1_000_000_000
    
    while st < en {
        
        let mid = (st + en) / 2
        
        if canPass(for: mid) < n {
            st = mid + 1
        
        } else {
            en = mid
        }
    }
    
    return Int64(st)
}