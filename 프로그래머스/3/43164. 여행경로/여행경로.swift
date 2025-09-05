import Foundation

// dfs
// N: 3~1만 -> O(N) 풀이 or O(NlgN) 풀이
// [a, b]

func solution(_ tickets:[[String]]) -> [String] {
    
    // 1. 도착 경로가 알파벳 순서가 앞서도록 정렬
    var tickets = tickets.sorted { $0[1] < $1[1] }
    print(tickets)
    
    let N = tickets.count
    var isUsed = Array(repeating: false, count: N)
    var result: [String] = []
    var isFinished = false
    
    func dfs(_ k: Int, _ route: [String]) {
        
        if isFinished { return }
        
        if k == N { 
            isFinished = true
            result = route
            return  
        }
        
        for i in 0..<N {
            if !isUsed[i] && route.last! == tickets[i][0] {
                isUsed[i] = true
                dfs(k+1, route + [tickets[i][1]])
                isUsed[i] = false
            }
        }
    }
    dfs(0, ["ICN"])
    
    return result
}