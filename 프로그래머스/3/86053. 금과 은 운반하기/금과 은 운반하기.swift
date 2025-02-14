import Foundation

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    
    // 각 도시에서 금, 은을 트럭이 운반
    // 트럭은 최대 w의 운반 가능
    // 걸리는 시간의 최솟값
    
    // a,b: 0~10억
    // 도시 개수: 1~10만
    // 금,은 매장량: 0~10억
    // 트럭 제한: 1~100
    // 편도시간: 1~10만
    
    // 최대 20억 * 1 / 1 * 10만 
    
    // 걸리는 시간을 T라고 했을때
    // T에 옮길 수 있는 금과 은의 양
    // 각 도시에서 최대 옮길 수 있는 횟수 maxTime : (T-t) / 2t + 1
    // 최대 옮길 수 있는 양 maxLoad : maxTime * w
    
    // 금이 충분한가? maxGold += min(g[i], maxLoad) // 그 시간동안 최대 금 옮길 수 있는 양
    // 은이 충분한가? maxSilver += min(s[i], maxLoad) // 그 시간동안 최대 은 옮길 수 있는 양
    // 다 옮길 수 있나? maxWeight += min(g[i]+s[i], maxLoad) // 일단 그 시간동안 옮길 수 있는 양
    
    // maxGold >= a && maxSilver >= b && maxWeight >= a + b
    // 모든 도시에 대한 합이 충족되는 최소 T
    
    var st = 0
    var en = Int(1e15)
    
    while st <= en {
        let T = (st + en) / 2
        
        var maxGold = 0
        var maxSilver = 0
        var maxWeight = 0
        
        for i in 0..<g.count {
            let maxTime = T / (2 * t[i]) + (T % (t[i] * 2) >= t[i] ? 1 : 0)
            let maxLoad = maxTime * w[i]
            
            maxGold += min(g[i], maxLoad)
            maxSilver += min(s[i], maxLoad)
            maxWeight += min(g[i] + s[i], maxLoad)
        }
        
        if maxGold >= a && maxSilver >= b && maxWeight >= a + b {
            en = T - 1
        } else {
            st = T + 1
        }
    }
    
    return Int64(st)
}