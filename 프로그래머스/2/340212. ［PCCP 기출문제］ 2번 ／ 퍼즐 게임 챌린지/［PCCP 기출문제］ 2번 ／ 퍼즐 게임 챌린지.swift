import Foundation

// n개의 퍼즐 풀기 게임

// 퍼즐: 난이도 & 소요시간
// 나 : 숙련도 > 틀리는 횟수 바뀜

// diff: 난이도
// times: 소요시간
// time_cur: 현재 퍼즐의 소요시간
// time_prev: 이전 퍼즐의 소요시간
// level: 숙련도
// limit: 제한시간


// 난이도 <= 숙련도 = time_cur 만큼 시간 소요
// 난이도 > 숙련도 = (난이도 - 숙련도) 횟수 틀림. (난이도 - 숙련도) * (time_cur + time_prev) + time_cur

// return 숙련도의 최솟값

// O(n) or O(nlgn)

// n: 1~30만 
// 난이도: 1~10만
// 시간: 1~1만
// limit: 1~


// 1. 특정 숙련도로 제한시간을 초과할 경우, 해당 숙련도가 필요함 (낮은 건 어짜피 초과함)

// [풀이]

// target 숙련도로 limit 초과? target 보다 높게.
// target 숙련도로 limit 해결? target이 최소 값인가?

// 이분탐색이고

// 1. 특정 숙련도로 걸리는 소요시간 체크 - O(N)
// 2. 특정 숙련도가 최솟값인지 이분탐색 - O(lgN)

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    
    let n = diffs.count
    
    // O(n)
    func checkTime(_ level: Int) -> Int {
        
        // 일단 처음은 무조건 풀 수 있다.
        var time_total = times[0]
        
        if n == 1 { return time_total }
        
        for i in 1..<n {
            let diff = diffs[i]
            let time_cur = times[i]
            let time_prev = times[i-1]
            
            if diff > level {
                time_total += (diff - level) * (time_cur + time_prev) + time_cur
            } else {
                time_total += time_cur
            }
        }
        
        return time_total
    } 
    
    // O(lgn)
    var level_min = 1
    var level_max = 100000
    
    while level_min < level_max {
        let mid = (level_min + level_max) / 2
        
        let time = checkTime(mid)
        
        if time > limit { // 더 level을 높여서 limit 안에 해결 가능하도록
            level_min = mid + 1
        } else {
            level_max = mid // 더 낮아질 수 있나? 이게 최솟값인가?
        }
    }
    
    return level_min
}