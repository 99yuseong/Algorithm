import Foundation

// 우리는 n개의 바위를 제거해서 minDist를 최대로 만들고 싶다.
// 우리가 목표로 하는 minDist는
    // 1. n개의 바위를 제거해서 만들 수 있어야 한다.
    // 2. 만족하는 값 중 최댓값. 즉 UpperBound를 찾아야한다.

func isPossible(_ rocks: [Int], _ targetDist: Int, _ n: Int) -> Bool {
    
    var prevIdx = 0
    var removed = 0
    
    for i in 1..<rocks.count {
        if rocks[i] - rocks[prevIdx] < targetDist {
            removed += 1
        } else {
            prevIdx = i
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
        
        if isPossible(allRocks, mid, n) {
            st = mid // 만족하는 상태에서 늘려야함
        } else {
            en = mid - 1 // 만족하지 않는 상태에서 줄여야함
        }
    }
    
    return st
}