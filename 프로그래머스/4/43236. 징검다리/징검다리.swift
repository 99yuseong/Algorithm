import Foundation

func isEnough(_ rocks: [Int], _ targetDist: Int, _ n: Int) -> Bool {
    
    var frontIdx = 0
    var removed = 0
    
    for i in 1..<rocks.count {
        if rocks[i] - rocks[frontIdx] < targetDist {
            removed += 1 // 바위 제거해서 거리를 늘려야함
        } else {
            frontIdx = i
        }
    }
    
    return removed <= n
}

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    
    let allRocks = [0] + rocks.sorted() + [distance]
    
    var st = 0
    var en = distance
    
    while st < en {
        
        let mid = (st + en + 1) / 2
        
        if isEnough(allRocks, mid, n) { // mid를 만족하려면 n개 이상을 제거해야함
            st = mid
        } else {
            en = mid - 1
        }
    }
    
    return st
}