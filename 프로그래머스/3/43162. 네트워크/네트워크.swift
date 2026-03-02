import Foundation

// 네트워크 A-B B-C

// n개의 컴퓨터, 네트워크의 개수는 몇개?

// n: 1~200
// BFS/DFS로 섬의 개수를 구하라

// 1. graph 변환 > 4만
// 2. BFS > 4만

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { return inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ k: T) { inbox.append(k) }
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var graph: [Int: [Int]] = [:]
    for i in 0..<n {
        for j in 0..<n {
            if i == j { continue }
            if computers[i][j] == 1 {
                graph[i, default: []].append(j)    
            }
        }
    }
    
    var visited = [Bool](repeating: false, count: n)
    var networks = 0
    
    for i in 0..<n {
        if !visited[i] {
            var queue = Queue<Int>()
            queue.append(i)
            networks += 1
            
            while !queue.isEmpty {
                let cur = queue.removeFirst()!
                for v in graph[cur, default: []] {
                    if !visited[v] {
                        queue.append(v)            
                        visited[v] = true
                    }
                }
            }
        }
    }
    
    return networks
}