import Foundation

// 1개 이상의 도시
// 금 a와 은 b가 필요
// 각 도시별 금 g[i] 은 s[i] 편도 t[i] w[i]의 광물을 나를 수 있음
// 가장 빠른 시간 안에 금 a와 은 b를 확보할 수 있는 가장 빠른 시간

// return t

// a, b: 0 ~ 10억
// 도시 : 10만개

// 편도 시간 : 1 ~ 10만초
// 각 도시별 t초에 만들 수 있는 금과 은의 용량

// 각 도시에서 금을 가져오든, 은을 가져오든, 뭘 가져올지 어떻게 알아?

// 1. 해당 도시에서 t초동안 가져올 수 있는 광물의 양 > 만족하는가? 즉, 금 + 은 들고올 수 있는 조건이 되나?
// 2. 금 다 들고오면 만족하는 조건이냐?
// 3. 은 다 들고오면 만족하는 조건이냐?



// t를 쓸건데, 

func isPossible(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int], _ targetT: Int) -> Bool {
    
    let n = g.count
    
    var maxWeight = 0
    var maxGold = 0
    var maxSilver = 0
    
    for i in 0..<n {
        
        let totalGold = g[i]
        let totalSilver = s[i]
        let weight = w[i]
        let time = t[i]
        let moveCnt = targetT / (time * 2) + (targetT % (time * 2) >= time ? 1 : 0) 
        let maxLoad = moveCnt * weight
        
        maxWeight += min(maxLoad, totalGold + totalSilver)
        maxGold += min(totalGold, maxLoad)
        maxSilver += min(totalSilver, maxLoad)
    }
    
    return maxWeight >= a + b && maxGold >= a && maxSilver >= b
}

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    
    var st = 0
    var en = Int(1e15)    // 10^5 시간 당 1씩 10^9를 2번 나르려면
    
    while st <= en {
        
        let mid = (st + en + 1) / 2
        
        if isPossible(a, b, g, s, w, t, mid) { // 시간의 최솟값 > 가능하면 줄여야함
            en = mid - 1
        } else {
            st = mid + 1 // 불가능하면 mid + 1
        }
    }
    
    return Int64(st)
}