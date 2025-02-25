import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, V) = (input[0], input[1], input[2])

var graph: [[Int]] = Array(repeating: [], count: N + 1)

// 간선 정보 저장 (양방향 그래프)
for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (edge[0], edge[1])
    graph[u].append(v)
    graph[v].append(u)
}

// **정점 번호가 작은 것부터 방문하기 위해 정렬**
for i in 1...N {
    graph[i].sort()
}

// ✅ DFS 구현 (재귀)
var visitedDFS = Array(repeating: false, count: N + 1)

func dfs(_ node: Int) {
    visitedDFS[node] = true
    print(node, terminator: " ")

    for neighbor in graph[node] {
        if !visitedDFS[neighbor] {
            dfs(neighbor)
        }
    }
}

// ✅ BFS 구현 (Queue 사용)
var visitedBFS = Array(repeating: false, count: N + 1)

func bfs(_ start: Int) {
    var queue: [Int] = [start]
    visitedBFS[start] = true

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        print(cur, terminator: " ")

        for neighbor in graph[cur] {
            if !visitedBFS[neighbor] {
                visitedBFS[neighbor] = true
                queue.append(neighbor)
            }
        }
    }
}

// 결과 출력
dfs(V)
print()
bfs(V)