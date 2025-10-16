import Foundation

// n명의 권투 선수
// 1대1 - 실력 싸움

// 경기 결과 분실

// return 정확하게 순위를 매길 수 있는 선수의 수

// n: 1~100명
// result.count: 1~4500
// [A, B] = A > B

// 풀이 1. 그래프 + BFS

// 정확하게 순위를 매길 수 있다 = 이기는 선수 + 지는 선수 == n-1

// 1. 이기는 그래프, 지는 그래프를 각각 만든다. O(100) + O(4500)
// 2. 모든 선수에 대해 O(100)
    // BFS로 이기는 선수, 지는 선수를 각각 카운트한다 O(100)
    // 이기는 선수 + 지는 선수 == n-1이라면
        // cnt++

// func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
//     // 1. 그래프 만들기 
//     var winGraph: [Int: [Int]] = [:]  // 이긴 사람 그래프
//     var loseGraph: [Int: [Int]] = [:] // 진 사람 그래프
    
//     for i in 1...n { 
//         winGraph[i] = []
//         loseGraph[i] = []
//     }
    
//     for result in results {
//         let win = result[0]
//         let lose = result[1]
        
//         winGraph[win, default: []].append(lose)
//         loseGraph[lose, default: []].append(win)
//     }
    
//     var cnt = 0
//     for i in 1...n {
//         if bfs(winGraph, i, n) + bfs(loseGraph, i, n) == n-1 {
//             cnt += 1
//         }
//     }
    
//     return cnt
// }

// func bfs(_ graph: [Int: [Int]], _ start: Int, _ n: Int) -> Int {
    
//     var count = 0
//     var queue: [Int] = []
//     var visited = [Bool](repeating: false, count: n)
        
//     queue.append(start)
//     visited[start-1] = true
        
//     while !queue.isEmpty {
//         let cur = queue.removeFirst()
            
//         for player in graph[cur]! {
//             if !visited[player-1] {
//                 queue.append(player)
//                 visited[player-1] = true
//                 count += 1
//             }
//         }
//     }
    
//     return count
// }

// 풀이 2: 플로이드-워셜 알고리즘

// 다익스트라 = 한 지점에서 다른 지점까지의 최단 경로

// 플로이드-워셜 = 모든 지점에서 다른 지점까지의 최단 경로
    // 2차원 테이블에 최단 거리 정보를 저장
    // 일종의 DP 알고리즘
    //  D_ab = min(D_ab, D_ak + D_kb)

    // 시간복잡도는 노드가 n개일때, O(n^3)

// 이기면 1, 지면 -1, 모르면 0

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    var FW = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    for result in results {
        
        let win = result[0]-1
        let lose = result[1]-1
        
        FW[win][lose] = 1
        FW[lose][win] = -1
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if FW[i][k] == 0 { // 경기 결과를 모르는 경우
                    
                    if FW[i][j] == 1 && FW[j][k] == 1 {
                        FW[i][k] = 1
                        FW[k][i] = -1
                    } else if FW[i][j] == -1 && FW[j][k] == -1 {
                        FW[i][k] = -1
                        FW[k][i] = 1
                    }
                } 
            }
        }
    }
    
    var cnt = 0
    for row in FW {
        cnt += row.filter { $0 == 0 }.count == 1 ? 1 : 0
    }
    
    return cnt
}












