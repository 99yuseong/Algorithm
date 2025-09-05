import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    
    // 1. 인접 리스트 생성 (출발지 -> (도착지, 사용횟수))
    var graph: [String: [String: Int]] = [:]
    
    for ticket in tickets {
        let from = ticket[0]
        let to = ticket[1]
        graph[from, default: [:]][to, default: 0] += 1
    }
    
    // 2. 각 출발지의 도착지들을 알파벳 순으로 정렬
    var sortedGraph: [String: [String]] = [:]
    for (from, destinations) in graph {
        sortedGraph[from] = destinations.keys.sorted()
    }
    
    var result: [String] = []
    let totalTickets = tickets.count
    
    func dfs(_ current: String, _ path: [String]) -> Bool {
        
        if path.count == totalTickets + 1 {
            result = path
            return true
        }
        
        guard let destinations = sortedGraph[current] else { return false }
        
        for destination in destinations {
            if graph[current]![destination]! > 0 {
                // 티켓 사용
                graph[current]![destination]! -= 1
                
                if dfs(destination, path + [destination]) {
                    return true
                }
                
                // 백트래킹: 티켓 복구
                graph[current]![destination]! += 1
            }
        }
        
        return false
    }
    
    dfs("ICN", ["ICN"])
    return result
}

// dfs
// N: 3~1만 -> O(N) 풀이 or O(NlgN) 풀이
// [a, b]

// func solution(_ tickets:[[String]]) -> [String] {
    
//     // 1. 도착 경로가 알파벳 순서가 앞서도록 정렬
//     var tickets = tickets.sorted { $0[1] < $1[1] }
//     print(tickets)
    
//     let N = tickets.count
//     var isUsed = Array(repeating: false, count: N)
//     var result: [String] = []
//     var isFinished = false
    
//     func dfs(_ k: Int, _ route: [String]) {
        
//         if isFinished { return }
        
//         if k == N { 
//             isFinished = true
//             result = route
//             return  
//         }
        
//         for i in 0..<N {
//             if !isUsed[i] && route.last! == tickets[i][0] {
//                 isUsed[i] = true
//                 dfs(k+1, route + [tickets[i][1]])
//                 isUsed[i] = false
//             }
//         }
//     }
//     dfs(0, ["ICN"])
    
//     return result
// }