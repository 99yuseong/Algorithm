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
    var minDiff = n
    
    for i in 0..<wires.count {
        // i번째 wire를 끊기
        var newWires = wires
        newWires.remove(at: i)
        
        let vertexs = makeVertexs(n, newWires)
        let cnt = bfs(vertexs)
        minDiff = min(abs((n - cnt) - cnt), minDiff)
    }
    
    return minDiff
}

func makeVertexs(_ n: Int, _ wires: [[Int]]) -> [[Int]] {
    var vertexs: [[Int]] = Array(repeating: [], count: n+1)
    for wire in wires {
        vertexs[wire[0]].append(wire[1])
        vertexs[wire[1]].append(wire[0])
    }
    return vertexs
}

func bfs(_ vertexs: [[Int]]) -> Int {
    var queue: [Int] = [1]   
    var visited = Array(repeating: false, count: vertexs.count)
    visited[1] = true
    var cnt = 1
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for near in vertexs[cur] {
            if !visited[near] {
                queue.append(near)
                visited[near] = true
                cnt += 1
            }
        }
    }
    return cnt
}