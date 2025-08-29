// n개의 송전탑
// 1개를 끊어 2개로 분할 -> 최대한 비슷하게

// return: 송전탑 개수 절댓값 차이 최솟값

// n: 2~100
// [v1, v2]

// [ [3], [3], [1,2], [3,5,6,7] ] -> O(N)
// 1번의 연결된 갯수 찾기

// wires를 돌면서 특정 wire 제외 
// -> vertex 형태로 변환
// -> 0번 인덱스와 연결된 cnt를 dfs로 구현
// -> abs((wires.count - cnt) - cnt)의 min값 구하기

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var result = n - 1
    let graph = makeGraph(n, wires)
    
    for wire in wires {
        let cntA = bfs(wire, graph)
        let cntB = n - cntA
        
        result = min(abs(cntA - cntB), result)
    }
    
    return result
}

func makeGraph(_ n: Int, _ wires: [[Int]]) -> [[Int]] {
    
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    return graph
}

func bfs(_ cutWire: [Int], _ graph: [[Int]]) -> Int {
    
    var queue: [Int] = []   
    var visited = Array(repeating: false, count: graph.count)
    var cnt = 0
    
    queue.append(1)
    visited[1] = true
    cnt += 1
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for v in graph[cur] {
            
            if !visited[v] 
            && cutWire != [cur, v]
            && cutWire != [v, cur] {
                
                queue.append(v)
                visited[v] = true
                cnt += 1
            }
        }
    }
    
    return cnt
}