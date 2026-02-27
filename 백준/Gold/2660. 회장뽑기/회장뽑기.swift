// 회장 선출
// 1. 모든 회원과 친구 - 1점

// 모든 사람과의 연결의 depth가 곧 점수
// 회장이 될 수 있는 모든 사람을 찾아라
func solution(_ n: Int, _ relation: [[Int]]) -> (s: Int, candidate: [Int]) {
    
    var graph: [Int: [Int]] = [:]
    for r in relation {
        graph[r[0], default: []].append(r[1])
        graph[r[1], default: []].append(r[0]) 
    }
    
    var scores = [Int](repeating: Int.max/4, count: n+1)

    // 1. BFS를 돌면서 Depth 체크. (f: Int, d: Int)
        // 50명 * (50명 + 2500관계)
    
    for i in 1...n {
        var visited = [Int](repeating: -1, count: n+1)
        var queue = [Int]()
        queue.append(i)
        visited[i] = 0
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for f in graph[cur, default: []] {
                if visited[f] == -1 {
                    queue.append(f)
                    visited[f] = visited[cur]+1
                }
            }
        }
        scores[i] = visited.max()!
    }

    let score = scores.min()!
    let candidate = scores
        .enumerated()
        .filter { $0.1 == score }
        .map { $0.0 }
        .sorted()
    
    return (score, candidate)
}

let N = Int(readLine()!)! // 1명 ~ 50명
var UV: [[Int]] = []
while true {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    if uv[0] == -1 { break }
    UV.append(uv)
}
let (score, candidate) = solution(N, UV)
print("\(score) \(candidate.count)")
print(candidate.map { String($0) }.joined(separator: " "))