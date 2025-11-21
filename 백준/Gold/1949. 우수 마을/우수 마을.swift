// N개의 마을로 이루어진 나라
// 1~N까지의 번호의 트리구조
// N-1개의 길
// 방향성이 없음
// 모든 마을은 연결

// 1. 우수 마을로 선정된 주민 합을 최대로
// 2. 인접하면 우수마을로 선정할 수 없음
// 3. 우수마을로 선정되지 못한 마을은 적어도 하나의 우수마을과 인접

// 마을 수 N: 1~1만
// return 주민수의 총합

// DP1[i]: i가 우수마을일때, 서브트리 주민 수의 총합
// DP2[i]: i가 우수마을이 아닐때, 서브트리 주민 수의 총합

// DP1[i] = DP2[i_1] + ... + DP2[i_k] + A[i]
// DP2[i] = max(DP1[i_1], DP2[i_1]) + ... + max(DP1[i_k], DP2[i_k])

// 시작점은 상관없고, 리프노드부터 채워나가면 될듯한데

// DP

func solution(_ villages: [Int], _ edges: [[Int]]) -> Int {

    var graph: [Int: [Int]] = [:]
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
        graph[edge[1], default: []].append(edge[0])
    }
    
    let a = [0] + villages
    var d1 = [Int](repeating: 0, count: villages.count+1)
    var d2 = [Int](repeating: 0, count: villages.count+1)
    
    func dfs(_ cur: Int, _ par: Int) {
        d1[cur] = a[cur]
        d2[cur] = 0
        for neighbor in graph[cur]! {
            if par == neighbor { continue }
            dfs(neighbor, cur)
            d1[cur] += d2[neighbor]
            d2[cur] += max(d1[neighbor], d2[neighbor])
        }
    }
    
    dfs(1, 0)
    return max(d1.max()!, d2.max()!)
}

let N = Int(readLine()!)!
let villages = readLine()!.split(separator: " ").map { Int(String($0))! }
var edges: [[Int]] = []
for _ in 0..<N-1 {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges.append(edge)
}
print(solution(villages, edges))
