// DFS와 BFS로 탐색한 결과를 출력하는 프로그램
// 정점 번호가 여러개 -> 작은 것부터 탐색
// 방문 점이 없는 경우 종료
// 번호는 1~N번
func solution(N: Int, M: Int, V: Int, edges: [[Int]]) -> [[Int]] {
    // N 1~1000
    // M 1~10000
    // 일단 테이블을 만들고, BFS, DFS를 담는 각각의 배열 처리하기
    
    var table: [[Int]] = Array(repeating: [], count: N+1)
    for edge in edges {
        table[edge[0]].append(edge[1])
        table[edge[1]].append(edge[0])
    }
    
    // DFS
    var result1: [Int] = []
    var stack: [Int] = []
    var visited1 = Array(repeating: false, count: N+1)
    
    stack.append(V)
    
    while !stack.isEmpty {
        let cur = stack.removeLast()
        
        if visited1[cur] { continue }
        
        visited1[cur] = true
        result1.append(cur)
        
        let neighbors = table[cur].sorted(by: >)
        
        for neighbor in neighbors {
            if !visited1[neighbor] {
                stack.append(neighbor)
            }
        }
    }
    
    // BFS
    var result2: [Int] = []
    var queue: [Int] = []
    var visited2 = Array(repeating: false, count: N+1)
    
    queue.append(V)
    visited2[V] = true
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        result2.append(cur)
        let neighbors = table[cur].sorted()
        
        for neighbor in neighbors {
            if !visited2[neighbor] {
                queue.append(neighbor)
                visited2[neighbor] = true
            }
        }
    }
    
    var result: [[Int]] = []
    result.append(result1)
    result.append(result2)
    
    return result
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
let V = input[2]
var edges: [[Int]] = []
for _ in 0..<M {
    edges.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for vs in solution(N: N, M: M, V: V, edges: edges) {
    print(vs.map { String($0) }.joined(separator: " "))
}
