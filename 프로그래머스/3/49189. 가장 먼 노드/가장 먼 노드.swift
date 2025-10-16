import Foundation

// n개의 노드
// 1번 노드에서 가장 멀리 떨어진 노드의 개수

// 최단 경로로 이동했을때, 간선의 개수가 가장 많은 노드

// 노드의 개수가 n

// 가장 멀리 떨어진 노드의 개수를 리턴

// n: 2~2만
// 양방향, 
// edge.count: 1~5만

// O(NlgN) or O(N)

// 1. graph - 형태로 만든다. - O(5만)
    // 연결된 vertex를 찾기 위함
// 2. BFS로 N개를 돌면서 cnt++ - O(2만)
    // queue
    // visited - cnt로
        // 떨어진 거리를 체크하기 위함
// 3. visited.max()!의 cnt 세기 - O(2만)

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ x: T) { inbox.append(x) }
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox = []
        }
        return outbox.popLast()
    }   
}


func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var graph: [Int : [Int]] = [:]
    
    // graph가 다 연결되어 있지 않을 수 잇다.
    for i in 1...n { graph[i] = [] }
    
    for e in edge {
        graph[e[0], default: []].append(e[1])
        graph[e[1], default: []].append(e[0])
    }
    
    var visited = [Int](repeating: -1, count: n)
    var queue = Queue<Int>()
    
    queue.append(1)
    visited[1-1] = 0
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()!
        
        for neighbor in graph[cur]! {
            if visited[neighbor-1] == -1 {
                queue.append(neighbor)
                visited[neighbor-1] = visited[cur-1] + 1
            }
        }      
    }
    
    let maxDistance = visited.max()!    
    
    return visited.filter { $0 == maxDistance }.count
}