// A - B - C = 같은 네트워크

// n: 컴퓨터의 개수
// 연결정보

// 네트워크의 개수를 리턴

// n: 1~200
// 0~n-1 인덱스의 컴퓨터
// [i][j] = 1

// 1. [i][j] -> graph로 변환 O(n^2)
// 2. BFS -> O(n)
    // 0~N-1까지 visited == false에서 BFS

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    let N = computers.count
    
    // 1. graph로 변환 O(N^2)
    var graph: [Int: [Int]] = [:]
    
    for i in 0..<N {
        for j in 0..<N {
            guard i != j else { continue }
            guard computers[i][j] == 1 else { continue }
            
            graph[i, default: []].append(j)   
        }
    }
    
    // 2. BFS - O(N)
    var networkCnt = 0
    var visited = [Bool](repeating: false, count: N)
    
    func BFS(_ start: Int) {
        var queue: [Int] = []
        
        queue.append(start)
        visited[start] = true
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            
            for node in graph[cur] ?? [] {
                guard !visited[node] else { continue }
                
                queue.append(node)
                visited[node] = true
            }
        }
        
        // 연결된 모든 노드 방문 후 cnt++
        networkCnt += 1
    }
    
    for i in 0..<N {
        guard !visited[i] else { continue }
        BFS(i)
    }
    
    return networkCnt
}