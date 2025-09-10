import Foundation

// 바위를 n개 제거했을 때 -> 거리가 가장 골고루 분배된 것은?
// 즉, 짧은 것부터 차근차근 제거해서 최소 간격을 늘리는 것!

// distance: 1~10억
// rocks: 1~5만
// remove: 1~5만
// 최소 간격: 0~10억

// 접근 1 - 무식하게
// 직관적으로 rocks K개 중 N개를 골라서 최소 간격 중 가장 큰 것을 고른다!
// 1. kCn -> 5만C2.5만 => 폭발

// 접근 2 - Parametric Search
// targetDist가 k일때
// 1. targetDist를 만족시키기 위해서 제거해야하는 바위가 n개 이상인가?
// 2. targetDist가 더 낮아질 수는 없나?

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    
    let positions = [0] + rocks.sorted() + [distance]
    
    // targetDist를 만족시키기 위해서 제거해야하는 바위가 n개 이상인가?
    func isEnough(targetDist: Int) -> Bool {
    
        var lastIdx = 0
        var removed = 0
        
        for i in 1..<positions.count {
            if positions[i] - positions[lastIdx] < targetDist {
                removed += 1
            } else {
                lastIdx = i
            }
        }
    
        return removed <= n
    }
    
    var st = 0
    var en = distance
    var answer = 0
    
    while st <= en {
        let k = (st + en) / 2
        
        if isEnough(targetDist: k) {
            answer = k
            st = k + 1
        } else {
            en = k - 1          
        }
    }
    
    return answer
}




