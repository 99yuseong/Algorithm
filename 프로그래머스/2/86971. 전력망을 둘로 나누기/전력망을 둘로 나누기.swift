import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // 1개를 끊어서 2개로 분할
    // 송전탑의 개수를 최대한 비슷하게

    // n개의 송전탑
    // 연결정보
    // 송전탑의 개수 차이를 리턴

    // n: 2~100
    // wires: 2차원 배열 1~99
    
    // BFS로 구현
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    var result = n-1
    
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    func bfs(_ st: Int, _ remA: Int, _ remB: Int) -> Int {
        var visited = Set<Int>()
        var queue = [st]
        visited.insert(st)
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            
            for tower in graph[cur] {
                if (cur == remA && tower == remB) || (cur == remB && tower == remA) { continue }
                
                if !visited.contains(tower) {
                    visited.insert(tower)
                    queue.append(tower)
                }
            }
        }
        
        return visited.count
    }
    
    for wire in wires {
        let countA = bfs(wire[0], wire[0], wire[1])
        
        result = min(result, abs(2*countA - n))
    }
    
    return result
}



