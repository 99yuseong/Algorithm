import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var st = times.min()!
    var en = times.max()! * n
    
    while st < en {
        let mid = (st + en) / 2
        let passed = times.reduce(0) { $0 + mid / $1 }
        
        if passed >= n {  
            en = mid
        } else { // passed < n -> 시간 늘려야함
            st = mid + 1
        }
    }
    
    return Int64(st)
}

// 기다리는 사람수 n, 
// 각 심시관이 심사를 하는데 걸리는 시간 times
// 모든 사람이 심사를 받는데 걸리는 최솟값

// n: 1~10억명
// time: 1~10억분
// times -> 1~10만명

// 시간의 최솟값
// 1초일때 몇명?
// 2초일때 몇명?

// parametric Search
// 1. 1~10억에서 lowerbound 이분탐색 -> O(lg10억)
// 2. 조건이 times / t를 합한게 n이 넘나? -> O(10만)
// -> O(10만 * lg10억)