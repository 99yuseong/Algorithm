// 1~N개의 섬 나라
// 두 섬을 연결하는 다리를 최소로 -> N-1개의 다리

// 다리가 하나밖에 없는 섬 - 괴도 루팡
// 가능성 있는 섬 모두 폭파
// 다이너마이트 최소화

// return 최소 다이너마이트 개수

// [제한사항]
// N: 1~1천개의 섬
// D는 1~20개 필요

// 문제는 노드가 아니라 edge
// 확실한건 다리는 N-1개. 즉 1번 섬을 제외하고 다이너마이트 비용이 곧 node로 쳐도 무방
// 그리고 모든 타겟은 리프노드
// 리프노드를 자르는 비용과 본인을 자르는 비용 중 최소를 계산

// dp[i] = i 노드의 서브트리 중 리프노드를 자르는 비용의 최솟값

// dp[i] = min(D[i], sum(dp[i_k]))
// dp[k] = D[k] (k는 리프노드)

func solution(_ N: Int, _ edges: [[Int]]) -> Int {

    var graph = Array(repeating: [Int](), count: N+1)
    var D = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
    
    for edge in edges {
        let u = edge[0], v = edge[1], w = edge[2]
        graph[u].append(v)
        graph[v].append(u)
        D[u][v] = w
        D[v][u] = w
    }
    
    var dp = Array(repeating: -1, count: N+1)
    
    func memo(_ i: Int, _ parent: Int) -> Int {
        
        if dp[i] != -1 { return dp[i] }
        
        var sum = 0
        var childCount = 0
        
        for next in graph[i] {
            if next == parent { continue }
            childCount += 1
            sum += memo(next, i)
        }
        
        // leaf
        if childCount == 0 {
            dp[i] = D[i][parent]
            return dp[i]
        }
        
        // internal
        dp[i] = min(D[i][parent], sum)
        return dp[i]
    }
    
    // root(1)의 parent는 0으로 둔다
    // root는 leaf가 될 수 없다는 문제 조건 활용
    var result = 0
    for next in graph[1] {
        result += memo(next, 1)
    }
    return result
}

let T = Int(readLine()!)!
var ans = ""
for _ in 0..<T {
    let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = NM[0]
    let M = NM[1]
    var edges: [[Int]] = []
    for _ in 0..<M {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        edges.append(line)
    }
    ans += "\(solution(N, edges))\n"
}
print(ans)
