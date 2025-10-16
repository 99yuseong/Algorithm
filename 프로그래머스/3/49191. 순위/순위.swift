import Foundation

// n명의 권투 선수
// 1대1 - 실력 싸움

// 경기 결과 분실

// return 정확하게 순위를 매길 수 있는 선수의 수

// n: 1~100명
// result.count: 1~4500
// [A, B] = A > B


// 그래프 표현 & 그래프 탐색 or 플로이드-워셜

    // winGraph
    // loseGraph

    // 각 그래프에서 이기는 사람 + 진 사람 = n-1이면 cnt++
// 플로이드 와샬
           
    // 이겼다 = 연결된 모든 카운트
    // 졌다 = 연결된 모든 카운트

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    // 1. 그래프 만들기 
    var winGraph: [Int: [Int]] = [:]  // 이긴 사람 그래프
    var loseGraph: [Int: [Int]] = [:] // 진 사람 그래프
    
    for i in 1...n { 
        winGraph[i] = []
        loseGraph[i] = []
    }
    
    for result in results {
        let win = result[0]
        let lose = result[1]
        
        winGraph[win, default: []].append(lose)
        loseGraph[lose, default: []].append(win)
    }
    
    var cnt = 0
    for i in 1...n {
        if bfs(winGraph, i, n) + bfs(loseGraph, i, n) == n-1 {
            cnt += 1
        }
    }
    
    return cnt
}

func bfs(_ graph: [Int: [Int]], _ start: Int, _ n: Int) -> Int {
    
    var count = 0
    var queue: [Int] = []
    var visited = [Bool](repeating: false, count: n)
        
    queue.append(start)
    visited[start-1] = true
        
    while !queue.isEmpty {
        let cur = queue.removeFirst()
            
        for player in graph[cur]! {
            if !visited[player-1] {
                queue.append(player)
                visited[player-1] = true
                count += 1
            }
        }
    }
    
    return count
}