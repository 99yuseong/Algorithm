// n명의 입국심사

// 대기 n명, 각 심사관별 t
// 모든 사람이 심사하는 최소 시간

// 무조건 들어가는게 아니라 더 빠른걸 기다릴 수도 있음
// n: 1~10억
// t: 1~10억분
// t_cnt: 1~10만

// O(NlgN)안쪽으로 -> 이분탐색

// 1. 정렬하고

// 남은시간 + times의 최솟값으로 돌아야하는데

// 최소 시간 안에 다 검사를 받을 수 있나?
// t시간
    // 가장 작은 t의 가능 사람 ~ 가장 높은 t의 가능 사람 합산 > n인가?

// 1. times 정렬
// 2. st = 0, end = 100만 * 1000만

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    // 1. 정렬 - O(NlgN)
    let times = times.sorted()
    
    // 2. 이분 탐색 - O(lgN)
    var st = 0
    var en = Int.max
    
    while st < en {
        
        let t = (st + en) / 2
        
        var passed = 0
        
        for time in times {
            if passed >= n { break }
            passed += t / time
        }
        
        // 충분한 시간
        if passed >= n {
            en = t
        } else {
            st = t + 1
        }
    }
    
    return Int64(st)
}