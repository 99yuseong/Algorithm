import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var tickets = tickets
    let N = tickets.count
    var answer: [String] = []
    var finished = false

    // 사전순 정렬 (도착지 기준)
    tickets.sort { $0[1] < $1[1] }
    
    var used = Array(repeating: false, count: N)
    
    func dfs(route: [String]) {
        if finished { return }
        
        if route.count == N + 1 {
            answer = route
            finished = true
            return
        }
        
        let last = route.last!
        for i in 0..<N {
            if !used[i], tickets[i][0] == last {
                used[i] = true
                dfs(route: route + [tickets[i][1]])
                used[i] = false
            }
        }
    }
    
    dfs(route: ["ICN"])
    return answer
}