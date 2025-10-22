import Foundation

// n개 섬 다리 건설 비용
// 모든 섬이 통행 가능하도록
// MST

// n: 1~100
// costs.count: 0~4550

// [섬1, 섬2, 비용]

// 1. costs 비용 순위로 정렬

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var costs = costs.sorted { $0[2] < $1[2] }
    var parent = [Int](repeating: -1, count: n)
    
    func find(_ a: Int) -> Int {
        if parent[a] < 0 { return a }
        return find(parent[a])
    }
    func union(_ a: Int, _ b: Int) -> Bool {
        let x = find(a)
        let y = find(b)
        if x == y { return false }
        parent[x] = y
        return true
    }
    
    var minCost = 0
    
    for cost in costs {
        
        let x = cost[0]
        let y = cost[1]
        let c = cost[2]
        
        if find(x) != find(y) {
            union(x, y)
            minCost += c
        }
    }
    
    return minCost
}