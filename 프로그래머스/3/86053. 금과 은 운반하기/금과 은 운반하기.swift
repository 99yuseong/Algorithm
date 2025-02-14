import Foundation

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int {
    var left = 0
    var right = Int(1e15) // 충분히 큰 값으로 설정
    var answer = right
    
    while left <= right {
        let mid = (left + right) / 2
        
        var totalGold = 0, totalSilver = 0, totalWeight = 0
        
        for i in 0..<g.count {
            let time = t[i]
            let maxTrips = mid / (time * 2) + (mid % (time * 2) >= time ? 1 : 0)
            let maxLoad = maxTrips * w[i]
            
            totalGold += min(g[i], maxLoad)
            totalSilver += min(s[i], maxLoad)
            totalWeight += min(g[i] + s[i], maxLoad)
        }
        
        if totalGold >= a && totalSilver >= b && totalWeight >= (a + b) {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return answer
}