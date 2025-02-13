import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    
    // 한번에 1명만 심사
    // 걸리는 시간 최소
    // n명을 심사
    // times: 걸리는 시간 배열
    // 최소 걸리는 시간
    
    // n: 1~10억 -> O(N) 또는 O(lgN)
    // t: 1~10억분 이하
    // t.count: 1~10만
    
    // 1~100만분
    // times.reduce(0) { $0 + t / $1 }
    // 이분 탐색으로 찾기
    // 매 분당 처리할 수 있는 인원 수 배열 -> 최대 100만 -> O(N)
    // 이분탐색으로 찾기 -> O(lgN)
    
    var st = times.min()!
    var en = times.max()! * n
    
    while st < en {
        let mid = (st + en) / 2
        
        let p = times.reduce(0) { $0 + (mid / $1) }
        
        if p < n { st = mid + 1 }
        else { en = mid }
    }
    
    return Int64(st)
}