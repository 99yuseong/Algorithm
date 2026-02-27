// 웜 바이러스
// 연결된 모든 컴퓨터로 전파
// 연결된 섬의 크기 > dfs

func solution(_ v: Int, _ uv: [[Int]]) -> Int {
    
    var graph: [Int: [Int]] = [:]
    for v in uv {
        graph[v[0], default: []].append(v[1])
        graph[v[1], default: []].append(v[0])
    }
    
    var visited = [Bool](repeating: false, count: v+1)
    var stack = [Int]()
    stack.append(1)
    while !stack.isEmpty {
        let cur = stack.removeLast()
        for v in graph[cur, default: []] {
            if !visited[v] {
                stack.append(v)
                visited[v] = true
            }
        }
    }
    
    return max(visited.map { $0 ? 1 : 0 }.reduce(0, +) - 1, 0)
}
let V = Int(readLine()!)! // 100대
let E = Int(readLine()!)!
var UV = [[Int]]()
for _ in 0..<E {
    UV.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(V, UV))